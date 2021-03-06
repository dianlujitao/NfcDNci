.class Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;
.super Ljava/lang/Thread;
.source "NdefPushServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/nfc/ndefpush/NdefPushServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionThread"
.end annotation


# instance fields
.field private mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

.field final synthetic this$0:Lcom/android/nfc/ndefpush/NdefPushServer;


# direct methods
.method constructor <init>(Lcom/android/nfc/ndefpush/NdefPushServer;Lcom/android/nfc/DeviceHost$LlcpSocket;)V
    .registers 4
    .param p2, "sock"    # Lcom/android/nfc/DeviceHost$LlcpSocket;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->this$0:Lcom/android/nfc/ndefpush/NdefPushServer;

    .line 67
    const-string v0, "NdefPushServer"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 68
    iput-object p2, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

    .line 69
    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 73
    const-string v6, "NdefPushServer"

    const-string v7, "starting connection thread"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    :try_start_7
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v6, 0x400

    invoke-direct {v0, v6}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 76
    .local v0, "buffer":Ljava/io/ByteArrayOutputStream;
    const/16 v6, 0x400

    new-array v4, v6, [B
    :try_end_12
    .catch Landroid/nfc/FormatException; {:try_start_7 .. :try_end_12} :catch_8f
    .catchall {:try_start_7 .. :try_end_12} :catchall_a6

    .line 78
    .local v4, "partial":[B
    const/4 v1, 0x0

    .line 81
    .local v1, "connectionBroken":Z
    :goto_13
    if-nez v1, :cond_3c

    .line 83
    :try_start_15
    iget-object v6, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v6, v4}, Lcom/android/nfc/DeviceHost$LlcpSocket;->receive([B)I

    move-result v5

    .line 84
    .local v5, "size":I
    const-string v6, "NdefPushServer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "read "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_39} :catch_85
    .catch Landroid/nfc/FormatException; {:try_start_15 .. :try_end_39} :catch_8f
    .catchall {:try_start_15 .. :try_end_39} :catchall_a6

    .line 85
    if-gez v5, :cond_80

    .line 86
    const/4 v1, 0x1

    .line 99
    .end local v5    # "size":I
    :cond_3c
    :try_start_3c
    new-instance v3, Lcom/android/nfc/ndefpush/NdefPushProtocol;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/android/nfc/ndefpush/NdefPushProtocol;-><init>([B)V

    .line 100
    .local v3, "msg":Lcom/android/nfc/ndefpush/NdefPushProtocol;
    const-string v6, "NdefPushServer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "got message "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    iget-object v6, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->this$0:Lcom/android/nfc/ndefpush/NdefPushServer;

    iget-object v6, v6, Lcom/android/nfc/ndefpush/NdefPushServer;->mCallback:Lcom/android/nfc/ndefpush/NdefPushServer$Callback;

    invoke-virtual {v3}, Lcom/android/nfc/ndefpush/NdefPushProtocol;->getImmediate()Landroid/nfc/NdefMessage;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/android/nfc/ndefpush/NdefPushServer$Callback;->onMessageReceived(Landroid/nfc/NdefMessage;)V
    :try_end_6c
    .catch Landroid/nfc/FormatException; {:try_start_3c .. :try_end_6c} :catch_8f
    .catchall {:try_start_3c .. :try_end_6c} :catchall_a6

    .line 108
    :try_start_6c
    const-string v6, "NdefPushServer"

    const-string v7, "about to close"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v6, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v6}, Lcom/android/nfc/DeviceHost$LlcpSocket;->close()V
    :try_end_78
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_78} :catch_b6

    .line 114
    .end local v0    # "buffer":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "connectionBroken":Z
    .end local v3    # "msg":Lcom/android/nfc/ndefpush/NdefPushProtocol;
    .end local v4    # "partial":[B
    :goto_78
    const-string v6, "NdefPushServer"

    const-string v7, "finished connection thread"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    return-void

    .line 89
    .restart local v0    # "buffer":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "connectionBroken":Z
    .restart local v4    # "partial":[B
    .restart local v5    # "size":I
    :cond_80
    const/4 v6, 0x0

    :try_start_81
    invoke-virtual {v0, v4, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_85
    .catch Landroid/nfc/FormatException; {:try_start_81 .. :try_end_84} :catch_8f
    .catchall {:try_start_81 .. :try_end_84} :catchall_a6

    goto :goto_13

    .line 91
    .end local v5    # "size":I
    :catch_85
    move-exception v2

    .line 93
    .local v2, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    .line 94
    :try_start_87
    const-string v6, "NdefPushServer"

    const-string v7, "connection broken by IOException"

    invoke-static {v6, v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8e
    .catch Landroid/nfc/FormatException; {:try_start_87 .. :try_end_8e} :catch_8f
    .catchall {:try_start_87 .. :try_end_8e} :catchall_a6

    goto :goto_13

    .line 104
    .end local v0    # "buffer":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "connectionBroken":Z
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "partial":[B
    :catch_8f
    move-exception v2

    .line 105
    .local v2, "e":Landroid/nfc/FormatException;
    :try_start_90
    const-string v6, "NdefPushServer"

    const-string v7, "badly formatted NDEF message, ignoring"

    invoke-static {v6, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_97
    .catchall {:try_start_90 .. :try_end_97} :catchall_a6

    .line 108
    :try_start_97
    const-string v6, "NdefPushServer"

    const-string v7, "about to close"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v6, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v6}, Lcom/android/nfc/DeviceHost$LlcpSocket;->close()V
    :try_end_a3
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_a3} :catch_a4

    goto :goto_78

    .line 110
    :catch_a4
    move-exception v6

    goto :goto_78

    .line 107
    .end local v2    # "e":Landroid/nfc/FormatException;
    :catchall_a6
    move-exception v6

    .line 108
    :try_start_a7
    const-string v7, "NdefPushServer"

    const-string v8, "about to close"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v7, p0, Lcom/android/nfc/ndefpush/NdefPushServer$ConnectionThread;->mSock:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v7}, Lcom/android/nfc/DeviceHost$LlcpSocket;->close()V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_b3} :catch_b4

    .line 112
    :goto_b3
    throw v6

    .line 110
    :catch_b4
    move-exception v7

    goto :goto_b3

    .restart local v0    # "buffer":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "connectionBroken":Z
    .restart local v3    # "msg":Lcom/android/nfc/ndefpush/NdefPushProtocol;
    .restart local v4    # "partial":[B
    :catch_b6
    move-exception v6

    goto :goto_78
.end method
