Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F101CF92
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062212; cv=none; b=k2H54wtlEJe5dnIr30XETZg3Aim9BxPQK+pzSXubleEnJbSyMIFPIHbCzgHybd49AN7yrNs48Tqj4aDfpPrTapxkJU6Ygh70bE1UxDBdu0qCQlLEL4e3hf4z0rDBJTsHqx5J5yJVpbQytOpgm7VhAMrDtq2CHtslC71luyAzkAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062212; c=relaxed/simple;
	bh=B2wvd/CB01ujsPoS5Kd4ZFSQ6NulkMiee6wcX+tSj2I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PZlHJ6gpnCQ9KYKy32HfmeTPG5j8AyEdN1WScOSyYbxKN8Q91OI4OKIe4QYH6feHLr7cFjdzqs1dYEOmbGqijSr1wK+JHKtqB7G2GqMs38OhXsNec7Jlzz5N2SR5BRoIHBqXRpaMtQUtBboyQiRq8CbH5Yv7g6b0VamIRmABQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4tquTss; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4tquTss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=btW7JMRmIlDNE50jj+sWMRswXm7lTcuk1sYqWQjNn/Y=;
	b=R4tquTssYsQTbanijXfpcYa1KWJE9i8Vo+3egbH0vJ1q9FPlO0HfXQTJRSJCZ5LWe/T5/D
	cvg9kIJoAu0y+s45HKgGiNMnW+K2cvGksqKVsHiXCY8izwfK2y1MwKh6u/p1ifMes3qDli
	DfRwNPnnUVzVa3OXfDzZ/XsLnkrtw8k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-DZwNVIIhMAuEtY_1_8mJNQ-1; Mon, 15 Jul 2024 12:50:07 -0400
X-MC-Unique: DZwNVIIhMAuEtY_1_8mJNQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367991a0a64so2908845f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062206; x=1721667006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btW7JMRmIlDNE50jj+sWMRswXm7lTcuk1sYqWQjNn/Y=;
        b=TCq3MYc0EMhZ8xjhQKAoiLUsvBc1nxtXuJj9i7V6xb/JLuPxvPvb7dPRPSZxq6YWNG
         XdS9aC0OTyfbvnrbutXIhYcsd2rlJ7/lJKuTP7ctDaCsnOHPMsvF+k+WJWoIol1uoG3X
         FsSt/4b4TgxMLoYCHJ0yAZnOec/whXwKbj5hkrgFDmP8mUOsw49lAque44u8xNMIt6lk
         TcExiRZObuUE9gxI1TWct0iSGhmotzRHaQ1A2Xv2plFEkDcO+BeYIdCs0LXiIs+w8Cp0
         By0DzNb63cgJEAlUS4ofP/EnPtA3CS+cj2E4KZFYKwDCRNfCOMUTtU0bHuhZ89wNMsOW
         jXiw==
X-Gm-Message-State: AOJu0Yyed9uHWNPoQj3Yq62xBAZ00JOvGAVuzmOw18JssvR4FGIx4BDZ
	ubr3s0vesrnsuhR0AJWzc2Ex1f0L1kUkLpBQS0QRrXPRqR4Okg6ec17Pll95IIY7GMPN8nyxOXu
	2YDpXwBqQVYiAosgoYTjlAsXN6eF4BmtRehqgiM7NsPaOrWUx1wGHJY65vtJrPaESitmpQKGbdm
	nO9W8bUbDJz1SNk9Pa6I1aOEmorsuhLEjL4dALfLWFFw==
X-Received: by 2002:a05:6000:1f84:b0:367:97b9:d5f3 with SMTP id ffacd0b85a97d-368240819a9mr282173f8f.2.1721062205944;
        Mon, 15 Jul 2024 09:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGiCcB2MKbHsophRFqRlC4I8Sdt1MOHpD4LYy9L0GxZ2FR7X+WvyQXiLjasBwscgE7BOgb1A==
X-Received: by 2002:a05:6000:1f84:b0:367:97b9:d5f3 with SMTP id ffacd0b85a97d-368240819a9mr282156f8f.2.1721062205456;
        Mon, 15 Jul 2024 09:50:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm6922520f8f.104.2024.07.15.09.50.04
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:50:04 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 8/9] makediff: cherry pick switch to tabularx
Message-ID: <88cdb7020f5b2771a6d201b1f65005da97e54f16.1721062136.git.mst@redhat.com>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/makediff.sh b/makediff.sh
index 11e518a..e068506 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -22,6 +22,7 @@ while read -r rev; do
 done << 'EOF'
 editorial: allow for longer device id table: makediff 1.3
 admin: Prepare table for multipage listing
+admin: switch to tabularx
 EOF
 
 #mv specvars.tex specvars-orig.tex
-- 
MST

