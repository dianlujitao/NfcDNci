.class public Lcom/android/nfc/echoserver/EchoServer$ServerThread;
.super Ljava/lang/Thread;
.source "EchoServer.java"

# interfaces
.implements Lcom/android/nfc/echoserver/EchoServer$WriteCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/nfc/echoserver/EchoServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ServerThread"
.end annotation


# instance fields
.field clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

.field final echoMachine:Lcom/android/nfc/echoserver/EchoServer$EchoMachine;

.field running:Z

.field serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

.field final synthetic this$0:Lcom/android/nfc/echoserver/EchoServer;


# direct methods
.method public constructor <init>(Lcom/android/nfc/echoserver/EchoServer;)V
    .registers 4

    .prologue
    .line 175
    iput-object p1, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->this$0:Lcom/android/nfc/echoserver/EchoServer;

    .line 176
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 171
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->running:Z

    .line 177
    new-instance v0, Lcom/android/nfc/echoserver/EchoServer$EchoMachine;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/nfc/echoserver/EchoServer$EchoMachine;-><init>(Lcom/android/nfc/echoserver/EchoServer$WriteCallback;Z)V

    iput-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->echoMachine:Lcom/android/nfc/echoserver/EchoServer$EchoMachine;

    .line 178
    return-void
.end method

.method private handleClient(Lcom/android/nfc/DeviceHost$LlcpSocket;)V
    .registers 9
    .param p1, "socket"    # Lcom/android/nfc/DeviceHost$LlcpSocket;

    .prologue
    .line 181
    const/4 v0, 0x0

    .line 182
    .local v0, "connectionBroken":Z
    const/16 v4, 0x400

    new-array v1, v4, [B

    .line 185
    .local v1, "dataUnit":[B
    :cond_5
    :goto_5
    if-nez v0, :cond_30

    .line 187
    :try_start_7
    invoke-interface {p1, v1}, Lcom/android/nfc/DeviceHost$LlcpSocket;->receive([B)I

    move-result v3

    .line 188
    .local v3, "size":I
    sget-boolean v4, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v4, :cond_2d

    const-string v4, "EchoServer"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "read "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    :cond_2d
    if-gez v3, :cond_31

    .line 190
    const/4 v0, 0x1

    .line 201
    .end local v3    # "size":I
    :cond_30
    return-void

    .line 193
    .restart local v3    # "size":I
    :cond_31
    iget-object v4, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->echoMachine:Lcom/android/nfc/echoserver/EchoServer$EchoMachine;

    invoke-virtual {v4, v1, v3}, Lcom/android/nfc/echoserver/EchoServer$EchoMachine;->pushUnit([BI)V
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_36} :catch_37

    goto :goto_5

    .line 195
    .end local v3    # "size":I
    :catch_37
    move-exception v2

    .line 197
    .local v2, "e":Ljava/io/IOException;
    const/4 v0, 0x1

    .line 198
    sget-boolean v4, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v4, :cond_5

    const-string v4, "EchoServer"

    const-string v5, "connection broken by IOException"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 205
    sget-boolean v0, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v0, :cond_d

    const-string v0, "EchoServer"

    const-string v1, "about create LLCP service socket"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->this$0:Lcom/android/nfc/echoserver/EchoServer;

    iget-object v0, v0, Lcom/android/nfc/echoserver/EchoServer;->mService:Lcom/android/nfc/NfcService;

    const/16 v1, 0x11

    const-string v2, "urn:nfc:sn:co-echo"

    const/16 v3, 0x80

    const/4 v4, 0x1

    const/16 v5, 0x400

    invoke-virtual/range {v0 .. v5}, Lcom/android/nfc/NfcService;->createLlcpServerSocket(ILjava/lang/String;III)Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;
    :try_end_20
    .catch Lcom/android/nfc/LlcpException; {:try_start_d .. :try_end_20} :catch_30

    .line 212
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    if-nez v0, :cond_32

    .line 213
    sget-boolean v0, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v0, :cond_2f

    const-string v0, "EchoServer"

    const-string v1, "failed to create LLCP service socket"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :cond_2f
    :goto_2f
    return-void

    .line 209
    :catch_30
    move-exception v6

    .line 210
    .local v6, "e":Lcom/android/nfc/LlcpException;
    goto :goto_2f

    .line 216
    .end local v6    # "e":Lcom/android/nfc/LlcpException;
    :cond_32
    sget-boolean v0, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v0, :cond_3d

    const-string v0, "EchoServer"

    const-string v1, "created LLCP service socket"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_3d
    :goto_3d
    iget-boolean v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->running:Z

    if-eqz v0, :cond_8e

    .line 221
    :try_start_41
    sget-boolean v0, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v0, :cond_4c

    const-string v0, "EchoServer"

    const-string v1, "about to accept"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    :cond_4c
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    invoke-interface {v0}, Lcom/android/nfc/DeviceHost$LlcpServerSocket;->accept()Lcom/android/nfc/DeviceHost$LlcpSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    .line 223
    sget-boolean v0, Lcom/android/nfc/echoserver/EchoServer;->DBG:Z

    if-eqz v0, :cond_72

    const-string v0, "EchoServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "accept returned "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_72
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-direct {p0, v0}, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->handleClient(Lcom/android/nfc/DeviceHost$LlcpSocket;)V
    :try_end_77
    .catch Lcom/android/nfc/LlcpException; {:try_start_41 .. :try_end_77} :catch_78
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_77} :catch_83

    goto :goto_3d

    .line 225
    :catch_78
    move-exception v6

    .line 226
    .restart local v6    # "e":Lcom/android/nfc/LlcpException;
    const-string v0, "EchoServer"

    const-string v1, "llcp error"

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 227
    iput-boolean v7, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->running:Z

    goto :goto_3d

    .line 228
    .end local v6    # "e":Lcom/android/nfc/LlcpException;
    :catch_83
    move-exception v6

    .line 229
    .local v6, "e":Ljava/io/IOException;
    const-string v0, "EchoServer"

    const-string v1, "IO error"

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 230
    iput-boolean v7, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->running:Z

    goto :goto_3d

    .line 234
    .end local v6    # "e":Ljava/io/IOException;
    :cond_8e
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->echoMachine:Lcom/android/nfc/echoserver/EchoServer$EchoMachine;

    invoke-virtual {v0}, Lcom/android/nfc/echoserver/EchoServer$EchoMachine;->shutdown()V

    .line 237
    :try_start_93
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v0}, Lcom/android/nfc/DeviceHost$LlcpSocket;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_98} :catch_a4

    .line 241
    :goto_98
    iput-object v8, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    .line 244
    :try_start_9a
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    invoke-interface {v0}, Lcom/android/nfc/DeviceHost$LlcpServerSocket;->close()V
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_9f} :catch_a2

    .line 248
    :goto_9f
    iput-object v8, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    goto :goto_2f

    .line 245
    :catch_a2
    move-exception v0

    goto :goto_9f

    .line 238
    :catch_a4
    move-exception v0

    goto :goto_98
.end method

.method public shutdown()V
    .registers 2

    .prologue
    .line 264
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->running:Z

    .line 265
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    if-eqz v0, :cond_f

    .line 267
    :try_start_7
    iget-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    invoke-interface {v0}, Lcom/android/nfc/DeviceHost$LlcpServerSocket;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_10

    .line 271
    :goto_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->serverSocket:Lcom/android/nfc/DeviceHost$LlcpServerSocket;

    .line 273
    :cond_f
    return-void

    .line 268
    :catch_10
    move-exception v0

    goto :goto_c
.end method

.method public write([B)V
    .registers 5
    .param p1, "data"    # [B

    .prologue
    .line 253
    iget-object v1, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    if-eqz v1, :cond_10

    .line 255
    :try_start_4
    iget-object v1, p0, Lcom/android/nfc/echoserver/EchoServer$ServerThread;->clientSocket:Lcom/android/nfc/DeviceHost$LlcpSocket;

    invoke-interface {v1, p1}, Lcom/android/nfc/DeviceHost$LlcpSocket;->send([B)V

    .line 256
    const-string v1, "EchoServer"

    const-string v2, "Send success!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_10} :catch_11

    .line 261
    :cond_10
    :goto_10
    return-void

    .line 257
    :catch_11
    move-exception v0

    .line 258
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "EchoServer"

    const-string v2, "Send failed."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10
.end method
