.class public Lcom/android/nfc/NfceeAccessControl;
.super Ljava/lang/Object;
.source "NfceeAccessControl.java"


# static fields
.field static final DBG:Z = true

.field public static final NFCEE_ACCESS_PATH:Ljava/lang/String; = "/etc/nfcee_access.xml"

.field static final TAG:Ljava/lang/String; = "NfceeAccess"


# instance fields
.field final mContext:Landroid/content/Context;

.field final mDebugPrintSignature:Z

.field final mNfceeAccess:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/pm/Signature;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final mUidCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/android/nfc/NfceeAccessControl;->mContext:Landroid/content/Context;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    .line 69
    invoke-virtual {p0}, Lcom/android/nfc/NfceeAccessControl;->parseNfceeAccess()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/nfc/NfceeAccessControl;->mDebugPrintSignature:Z

    .line 70
    return-void
.end method


# virtual methods
.method public check(ILjava/lang/String;)Z
    .registers 14
    .param p1, "uid"    # I
    .param p2, "pkg"    # Ljava/lang/String;

    .prologue
    .line 78
    monitor-enter p0

    .line 79
    :try_start_1
    iget-object v8, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 80
    .local v2, "cached":Ljava/lang/Boolean;
    if-eqz v2, :cond_15

    .line 81
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    monitor-exit p0

    .line 100
    :goto_14
    return v0

    .line 84
    :cond_15
    const/4 v0, 0x0

    .line 87
    .local v0, "access":Z
    iget-object v8, p0, Lcom/android/nfc/NfceeAccessControl;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 88
    .local v6, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v6, p1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v5

    .line 89
    .local v5, "pkgs":[Ljava/lang/String;
    move-object v1, v5

    .local v1, "arr$":[Ljava/lang/String;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_23
    if-ge v3, v4, :cond_34

    aget-object v7, v1, v3

    .line 90
    .local v7, "uidPkg":Ljava/lang/String;
    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_46

    .line 92
    invoke-virtual {p0, p2}, Lcom/android/nfc/NfceeAccessControl;->checkPackageNfceeAccess(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_34

    .line 93
    const/4 v0, 0x1

    .line 99
    .end local v7    # "uidPkg":Ljava/lang/String;
    :cond_34
    iget-object v8, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    monitor-exit p0

    goto :goto_14

    .line 101
    .end local v0    # "access":Z
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "cached":Ljava/lang/Boolean;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "pkgs":[Ljava/lang/String;
    .end local v6    # "pm":Landroid/content/pm/PackageManager;
    :catchall_43
    move-exception v8

    monitor-exit p0
    :try_end_45
    .catchall {:try_start_1 .. :try_end_45} :catchall_43

    throw v8

    .line 89
    .restart local v0    # "access":Z
    .restart local v1    # "arr$":[Ljava/lang/String;
    .restart local v2    # "cached":Ljava/lang/Boolean;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "pkgs":[Ljava/lang/String;
    .restart local v6    # "pm":Landroid/content/pm/PackageManager;
    .restart local v7    # "uidPkg":Ljava/lang/String;
    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_23
.end method

.method public check(Landroid/content/pm/ApplicationInfo;)Z
    .registers 5
    .param p1, "info"    # Landroid/content/pm/ApplicationInfo;

    .prologue
    .line 110
    monitor-enter p0

    .line 111
    :try_start_1
    iget-object v1, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    iget v2, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 112
    .local v0, "access":Ljava/lang/Boolean;
    if-nez v0, :cond_26

    .line 113
    iget-object v1, p1, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/nfc/NfceeAccessControl;->checkPackageNfceeAccess(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    iget v2, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :cond_26
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    monitor-exit p0

    return v1

    .line 117
    .end local v0    # "access":Ljava/lang/Boolean;
    :catchall_2c
    move-exception v1

    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_2c

    throw v1
.end method

.method checkPackageNfceeAccess(Ljava/lang/String;)Z
    .registers 16
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v11, p0, Lcom/android/nfc/NfceeAccessControl;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 133
    .local v9, "pm":Landroid/content/pm/PackageManager;
    const/16 v11, 0x40

    :try_start_8
    invoke-virtual {v9, p1, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 134
    .local v4, "info":Landroid/content/pm/PackageInfo;
    iget-object v11, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-nez v11, :cond_12

    .line 135
    const/4 v11, 0x0

    .line 171
    .end local v4    # "info":Landroid/content/pm/PackageInfo;
    :goto_11
    return v11

    .line 138
    .restart local v4    # "info":Landroid/content/pm/PackageInfo;
    :cond_12
    iget-object v0, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .local v0, "arr$":[Landroid/content/pm/Signature;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[Landroid/content/pm/Signature;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .local v3, "i$":I
    :goto_17
    if-ge v3, v5, :cond_7e

    aget-object v10, v0, v3

    .line 139
    .local v10, "s":Landroid/content/pm/Signature;
    if-nez v10, :cond_21

    .line 138
    .end local v3    # "i$":I
    :cond_1d
    add-int/lit8 v2, v3, 0x1

    .restart local v2    # "i$":I
    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_17

    .line 142
    :cond_21
    iget-object v11, p0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v11, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    .line 143
    .local v8, "packages":[Ljava/lang/String;
    if-eqz v8, :cond_1d

    .line 146
    array-length v11, v8

    if-nez v11, :cond_4e

    .line 148
    const-string v11, "NfceeAccess"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Granted NFCEE access to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " (wildcard)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    const/4 v11, 0x1

    goto :goto_11

    .line 151
    :cond_4e
    move-object v1, v8

    .local v1, "arr$":[Ljava/lang/String;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_51
    if-ge v2, v6, :cond_1d

    aget-object v7, v1, v2

    .line 152
    .local v7, "p":Ljava/lang/String;
    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7b

    .line 154
    const-string v11, "NfceeAccess"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Granted access to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " (explicit)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    const/4 v11, 0x1

    goto :goto_11

    .line 151
    :cond_7b
    add-int/lit8 v2, v2, 0x1

    goto :goto_51

    .line 160
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "p":Ljava/lang/String;
    .end local v8    # "packages":[Ljava/lang/String;
    .end local v10    # "s":Landroid/content/pm/Signature;
    .restart local v3    # "i$":I
    :cond_7e
    iget-boolean v11, p0, Lcom/android/nfc/NfceeAccessControl;->mDebugPrintSignature:Z

    if-eqz v11, :cond_ba

    .line 161
    const-string v11, "NfceeAccess"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "denied NFCEE access for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " with signature:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v0, v4, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .restart local v0    # "arr$":[Landroid/content/pm/Signature;
    array-length v5, v0

    .restart local v5    # "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_a4
    if-ge v2, v5, :cond_b7

    aget-object v10, v0, v2

    .line 163
    .restart local v10    # "s":Landroid/content/pm/Signature;
    if-eqz v10, :cond_b3

    .line 164
    const-string v11, "NfceeAccess"

    invoke-virtual {v10}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_b3} :catch_b6

    .line 162
    :cond_b3
    add-int/lit8 v2, v2, 0x1

    goto :goto_a4

    .line 168
    .end local v0    # "arr$":[Landroid/content/pm/Signature;
    .end local v2    # "i$":I
    .end local v4    # "info":Landroid/content/pm/PackageInfo;
    .end local v5    # "len$":I
    .end local v10    # "s":Landroid/content/pm/Signature;
    :catch_b6
    move-exception v11

    .line 171
    :cond_b7
    :goto_b7
    const/4 v11, 0x0

    goto/16 :goto_11

    .restart local v3    # "i$":I
    .restart local v4    # "info":Landroid/content/pm/PackageInfo;
    :cond_ba
    move v2, v3

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    goto :goto_b7
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 17
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 272
    const-string v9, "mNfceeAccess="

    invoke-virtual {p2, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 273
    iget-object v9, p0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/Signature;

    .line 274
    .local v7, "s":Landroid/content/pm/Signature;
    const-string v9, "\t%s ["

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v7}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p2, v9, v10}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 275
    iget-object v9, p0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    .line 276
    .local v6, "ps":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_35
    if-ge v3, v4, :cond_47

    aget-object v5, v0, v3

    .line 277
    .local v5, "p":Ljava/lang/String;
    const-string v9, "%s, "

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v5, v10, v11

    invoke-virtual {p2, v9, v10}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 276
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    .line 279
    .end local v5    # "p":Ljava/lang/String;
    :cond_47
    const-string v9, "]"

    invoke-virtual {p2, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_f

    .line 281
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "ps":[Ljava/lang/String;
    .end local v7    # "s":Landroid/content/pm/Signature;
    :cond_4d
    monitor-enter p0

    .line 282
    :try_start_4e
    const-string v9, "mNfceeUidCache="

    invoke-virtual {p2, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 283
    iget-object v9, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_5d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_83

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 284
    .local v8, "uid":Ljava/lang/Integer;
    iget-object v9, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 285
    .local v1, "b":Ljava/lang/Boolean;
    const-string v9, "\t%d %s\n"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v8, v10, v11

    const/4 v11, 0x1

    aput-object v1, v10, v11

    invoke-virtual {p2, v9, v10}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    goto :goto_5d

    .line 287
    .end local v1    # "b":Ljava/lang/Boolean;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v8    # "uid":Ljava/lang/Integer;
    :catchall_80
    move-exception v9

    monitor-exit p0
    :try_end_82
    .catchall {:try_start_4e .. :try_end_82} :catchall_80

    throw v9

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_83
    :try_start_83
    monitor-exit p0
    :try_end_84
    .catchall {:try_start_83 .. :try_end_84} :catchall_80

    .line 288
    return-void
.end method

.method public invalidateCache()V
    .registers 2

    .prologue
    .line 121
    monitor-enter p0

    .line 122
    :try_start_1
    iget-object v0, p0, Lcom/android/nfc/NfceeAccessControl;->mUidCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 123
    monitor-exit p0

    .line 124
    return-void

    .line 123
    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method

.method parseNfceeAccess()Z
    .registers 18

    .prologue
    .line 182
    new-instance v5, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v14

    const-string v15, "/etc/nfcee_access.xml"

    invoke-direct {v5, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 183
    .local v5, "file":Ljava/io/File;
    const/4 v10, 0x0

    .line 184
    .local v10, "reader":Ljava/io/FileReader;
    const/4 v1, 0x0

    .line 186
    .local v1, "debug":Z
    :try_start_d
    new-instance v11, Ljava/io/FileReader;

    invoke-direct {v11, v5}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_12
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d .. :try_end_12} :catch_192
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_12} :catch_18f
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_18c
    .catchall {:try_start_d .. :try_end_12} :catchall_18a

    .line 187
    .end local v10    # "reader":Ljava/io/FileReader;
    .local v11, "reader":Ljava/io/FileReader;
    :try_start_12
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v4

    .line 188
    .local v4, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v4}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 189
    .local v9, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v9, v11}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 192
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .local v8, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v12, 0x0

    .line 194
    .local v12, "signature":Landroid/content/pm/Signature;
    const-string v14, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v15, 0x0

    invoke-interface {v9, v14, v15}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 196
    :cond_29
    :goto_29
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 197
    .local v3, "event":I
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v13

    .line 198
    .local v13, "tag":Ljava/lang/String;
    const/4 v14, 0x2

    if-ne v3, v14, :cond_bb

    const-string v14, "signer"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_bb

    .line 199
    const/4 v12, 0x0

    .line 200
    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 201
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_41
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v14

    if-ge v6, v14, :cond_5c

    .line 202
    const-string v14, "android:signature"

    invoke-interface {v9, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a4

    .line 203
    new-instance v12, Landroid/content/pm/Signature;

    .end local v12    # "signature":Landroid/content/pm/Signature;
    invoke-interface {v9, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14}, Landroid/content/pm/Signature;-><init>(Ljava/lang/String;)V

    .line 207
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    :cond_5c
    if-nez v12, :cond_a7

    .line 208
    const-string v14, "NfceeAccess"

    const-string v15, "signer tag is missing android:signature attribute, igorning"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_65
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_12 .. :try_end_65} :catch_66
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_65} :catch_d1
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_65} :catch_f5
    .catchall {:try_start_12 .. :try_end_65} :catchall_125

    goto :goto_29

    .line 252
    .end local v3    # "event":I
    .end local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "i":I
    .end local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "signature":Landroid/content/pm/Signature;
    .end local v13    # "tag":Ljava/lang/String;
    :catch_66
    move-exception v2

    move-object v10, v11

    .line 253
    .end local v11    # "reader":Ljava/io/FileReader;
    .local v2, "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v10    # "reader":Ljava/io/FileReader;
    :goto_68
    :try_start_68
    const-string v14, "NfceeAccess"

    const-string v15, "failed to load NFCEE access list"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 254
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v14}, Ljava/util/HashMap;->clear()V
    :try_end_76
    .catchall {:try_start_68 .. :try_end_76} :catchall_18a

    .line 261
    if-eqz v10, :cond_7b

    .line 263
    :try_start_78
    invoke-virtual {v10}, Ljava/io/InputStreamReader;->close()V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_7b} :catch_185

    .line 267
    .end local v2    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :cond_7b
    :goto_7b
    const-string v14, "NfceeAccess"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "read "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->size()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " signature(s) for NFCEE access"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    return v1

    .line 201
    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v3    # "event":I
    .restart local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "i":I
    .restart local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "reader":Ljava/io/FileReader;
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_a4
    add-int/lit8 v6, v6, 0x1

    goto :goto_41

    .line 211
    :cond_a7
    :try_start_a7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v14, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_29

    .line 212
    const-string v14, "NfceeAccess"

    const-string v15, "duplicate signature, ignoring"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    const/4 v12, 0x0

    .line 214
    goto/16 :goto_29

    .line 216
    .end local v6    # "i":I
    :cond_bb
    const/4 v14, 0x3

    if-ne v3, v14, :cond_10f

    const-string v14, "signer"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_10f

    .line 217
    if-nez v12, :cond_e2

    .line 218
    const-string v14, "NfceeAccess"

    const-string v15, "mis-matched signer tag"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_cf
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a7 .. :try_end_cf} :catch_66
    .catch Ljava/io/FileNotFoundException; {:try_start_a7 .. :try_end_cf} :catch_d1
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_cf} :catch_f5
    .catchall {:try_start_a7 .. :try_end_cf} :catchall_125

    goto/16 :goto_29

    .line 255
    .end local v3    # "event":I
    .end local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "signature":Landroid/content/pm/Signature;
    .end local v13    # "tag":Ljava/lang/String;
    :catch_d1
    move-exception v2

    move-object v10, v11

    .line 256
    .end local v11    # "reader":Ljava/io/FileReader;
    .local v2, "e":Ljava/io/FileNotFoundException;
    .restart local v10    # "reader":Ljava/io/FileReader;
    :goto_d3
    :try_start_d3
    const-string v14, "NfceeAccess"

    const-string v15, "could not find /etc/nfcee_access.xml, no NFCEE access allowed"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_da
    .catchall {:try_start_d3 .. :try_end_da} :catchall_18a

    .line 261
    if-eqz v10, :cond_7b

    .line 263
    :try_start_dc
    invoke-virtual {v10}, Ljava/io/InputStreamReader;->close()V
    :try_end_df
    .catch Ljava/io/IOException; {:try_start_dc .. :try_end_df} :catch_e0

    goto :goto_7b

    .line 264
    :catch_e0
    move-exception v14

    goto :goto_7b

    .line 221
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v3    # "event":I
    .restart local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "reader":Ljava/io/FileReader;
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_e2
    :try_start_e2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/String;

    invoke-virtual {v8, v15}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v12, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V
    :try_end_f3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e2 .. :try_end_f3} :catch_66
    .catch Ljava/io/FileNotFoundException; {:try_start_e2 .. :try_end_f3} :catch_d1
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_f3} :catch_f5
    .catchall {:try_start_e2 .. :try_end_f3} :catchall_125

    goto/16 :goto_29

    .line 257
    .end local v3    # "event":I
    .end local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "signature":Landroid/content/pm/Signature;
    .end local v13    # "tag":Ljava/lang/String;
    :catch_f5
    move-exception v2

    move-object v10, v11

    .line 258
    .end local v11    # "reader":Ljava/io/FileReader;
    .local v2, "e":Ljava/io/IOException;
    .restart local v10    # "reader":Ljava/io/FileReader;
    :goto_f7
    :try_start_f7
    const-string v14, "NfceeAccess"

    const-string v15, "Failed to load NFCEE access list"

    invoke-static {v14, v15, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 259
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/nfc/NfceeAccessControl;->mNfceeAccess:Ljava/util/HashMap;

    invoke-virtual {v14}, Ljava/util/HashMap;->clear()V
    :try_end_105
    .catchall {:try_start_f7 .. :try_end_105} :catchall_18a

    .line 261
    if-eqz v10, :cond_7b

    .line 263
    :try_start_107
    invoke-virtual {v10}, Ljava/io/InputStreamReader;->close()V
    :try_end_10a
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_10a} :catch_10c

    goto/16 :goto_7b

    .line 264
    :catch_10c
    move-exception v14

    goto/16 :goto_7b

    .line 223
    .end local v2    # "e":Ljava/io/IOException;
    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v3    # "event":I
    .restart local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "reader":Ljava/io/FileReader;
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_10f
    const/4 v14, 0x2

    if-ne v3, v14, :cond_168

    :try_start_112
    const-string v14, "package"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_168

    .line 224
    if-nez v12, :cond_12d

    .line 225
    const-string v14, "NfceeAccess"

    const-string v15, "ignoring unnested packge tag"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_123
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_112 .. :try_end_123} :catch_66
    .catch Ljava/io/FileNotFoundException; {:try_start_112 .. :try_end_123} :catch_d1
    .catch Ljava/io/IOException; {:try_start_112 .. :try_end_123} :catch_f5
    .catchall {:try_start_112 .. :try_end_123} :catchall_125

    goto/16 :goto_29

    .line 261
    .end local v3    # "event":I
    .end local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "signature":Landroid/content/pm/Signature;
    .end local v13    # "tag":Ljava/lang/String;
    :catchall_125
    move-exception v14

    move-object v10, v11

    .end local v11    # "reader":Ljava/io/FileReader;
    .restart local v10    # "reader":Ljava/io/FileReader;
    :goto_127
    if-eqz v10, :cond_12c

    .line 263
    :try_start_129
    invoke-virtual {v10}, Ljava/io/InputStreamReader;->close()V
    :try_end_12c
    .catch Ljava/io/IOException; {:try_start_129 .. :try_end_12c} :catch_188

    .line 264
    :cond_12c
    :goto_12c
    throw v14

    .line 228
    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v3    # "event":I
    .restart local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "reader":Ljava/io/FileReader;
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_12d
    const/4 v7, 0x0

    .line 229
    .local v7, "name":Ljava/lang/String;
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_12f
    :try_start_12f
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v14

    if-ge v6, v14, :cond_145

    .line 230
    const-string v14, "android:name"

    invoke-interface {v9, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_151

    .line 231
    invoke-interface {v9, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    .line 235
    :cond_145
    if-nez v7, :cond_154

    .line 236
    const-string v14, "NfceeAccess"

    const-string v15, "package missing android:name, ignoring signer group"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    const/4 v12, 0x0

    .line 238
    goto/16 :goto_29

    .line 229
    :cond_151
    add-int/lit8 v6, v6, 0x1

    goto :goto_12f

    .line 241
    :cond_154
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_163

    .line 242
    const-string v14, "NfceeAccess"

    const-string v15, "duplicate package name in signer group, ignoring"

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_29

    .line 245
    :cond_163
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_29

    .line 246
    .end local v6    # "i":I
    .end local v7    # "name":Ljava/lang/String;
    :cond_168
    const/4 v14, 0x2

    if-ne v3, v14, :cond_176

    const-string v14, "debug"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_170
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_12f .. :try_end_170} :catch_66
    .catch Ljava/io/FileNotFoundException; {:try_start_12f .. :try_end_170} :catch_d1
    .catch Ljava/io/IOException; {:try_start_12f .. :try_end_170} :catch_f5
    .catchall {:try_start_12f .. :try_end_170} :catchall_125

    move-result v14

    if-eqz v14, :cond_176

    .line 247
    const/4 v1, 0x1

    goto/16 :goto_29

    .line 248
    :cond_176
    const/4 v14, 0x1

    if-ne v3, v14, :cond_29

    .line 261
    if-eqz v11, :cond_195

    .line 263
    :try_start_17b
    invoke-virtual {v11}, Ljava/io/InputStreamReader;->close()V
    :try_end_17e
    .catch Ljava/io/IOException; {:try_start_17b .. :try_end_17e} :catch_181

    move-object v10, v11

    .line 264
    .end local v11    # "reader":Ljava/io/FileReader;
    .restart local v10    # "reader":Ljava/io/FileReader;
    goto/16 :goto_7b

    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v11    # "reader":Ljava/io/FileReader;
    :catch_181
    move-exception v14

    move-object v10, v11

    .end local v11    # "reader":Ljava/io/FileReader;
    .restart local v10    # "reader":Ljava/io/FileReader;
    goto/16 :goto_7b

    .end local v3    # "event":I
    .end local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "signature":Landroid/content/pm/Signature;
    .end local v13    # "tag":Ljava/lang/String;
    .local v2, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_185
    move-exception v14

    goto/16 :goto_7b

    .end local v2    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_188
    move-exception v15

    goto :goto_12c

    .line 261
    :catchall_18a
    move-exception v14

    goto :goto_127

    .line 257
    :catch_18c
    move-exception v2

    goto/16 :goto_f7

    .line 255
    :catch_18f
    move-exception v2

    goto/16 :goto_d3

    .line 252
    :catch_192
    move-exception v2

    goto/16 :goto_68

    .end local v10    # "reader":Ljava/io/FileReader;
    .restart local v3    # "event":I
    .restart local v4    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v8    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v11    # "reader":Ljava/io/FileReader;
    .restart local v12    # "signature":Landroid/content/pm/Signature;
    .restart local v13    # "tag":Ljava/lang/String;
    :cond_195
    move-object v10, v11

    .end local v11    # "reader":Ljava/io/FileReader;
    .restart local v10    # "reader":Ljava/io/FileReader;
    goto/16 :goto_7b
.end method
