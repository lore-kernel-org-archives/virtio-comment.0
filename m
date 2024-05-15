Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107C56458
	for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764858; cv=none; b=TxtGrAlbKyI6IFnfTNy1/CKaCkZPLlDioA1mfHXDh5wWp9j9jDItD0kiXYlv9BZqThH/h8pcHZshZ+/hUhyxDm4jSNfzOC+XX1pM012LKpl9rOKH4pdHo71UsMoVbft8dfHTWu7DVx1H8WnyaGm15DQjWHkK+Wi5K5aeSUl372o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764858; c=relaxed/simple;
	bh=uabB7uqUe9IXjQZ4eK6b6mpQuI7IrV6ptziI0mDtiSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnXG1OMX3M9I9nbO2087hebMuhWro4Fh0xOr6XCAsBnlD884eLGgq5jzjxMGmnXXnROz2DhXO/wdgvV8UmFpDYMtjKSiD95b37aOKL6+yYrhh436+ASClS3vNW6GldRj4VUJNLnSQzNc+BofBmVTe2tl4/maNRHwbiISslHH2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/XvYlD5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/XvYlD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715764855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=iTXsZTYVVjRo8+6Pt7h3HVqXiHlT1xQWRIGRXKe+28s=;
	b=B/XvYlD5jDlUspuU5qzxpLvdR+8OMTIAg6Wx2c4FBSWX6q4GMn0aRqkgTOgaPCCuu2zV7s
	tyre4mRiW23OSzwweepubSHgDzj/hKeo/bow4fZou/Iok15/tmEaE4wIbCV/kQcFx6zyRU
	oJAx7ScVoGE22nevTvJu8Q860Wy7GMo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-auP2ANVwMkeJkNI6PgsHtg-1; Wed, 15 May 2024 05:20:38 -0400
X-MC-Unique: auP2ANVwMkeJkNI6PgsHtg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34dc34c758fso3604909f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 02:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764837; x=1716369637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTXsZTYVVjRo8+6Pt7h3HVqXiHlT1xQWRIGRXKe+28s=;
        b=g+Jq7ScJkwdziN2cmRX8aPxJgqS56a9IZ5sHpoq5nsyuoddMcJ5kKp4jLbcUxvVVy0
         60xDFhmeDZNynrrCQjavjnAizCaMrr9RzQioKfrEO4Rr0DRrTwT/SMCntDiXomPgxSOZ
         Bae+14E7O7mtZJosssbT9mkba/kFaHlUiH1cMO6FUcysjpl9TQcyj+GAK7n6hg188/YV
         qcpV8EfjBQ9HzLg/mfCrdKmkqnVr9lpEGVl2v0vmKqzzBGlff2BOT7N04qU8syaEUo3O
         mLzMDyVWVGA1ouCOuLLpLVBBKOh6stTSKyFnaTZ5ZAwqJZjJbaGxYY1akbGLuSGUXNcG
         DRZA==
X-Gm-Message-State: AOJu0YwL/j+wtpXnl8FDI7WBupXqjHjAG4s2FrCELWDrRpmvmX6myXqS
	aBak3pIGa85PTPczAiSRlljipse55XbEQ66XIN8/dOiTTWPrIVN4o8r+W35sTNYrqzH0zuilikB
	yVnZccgXgB2BB474E4Y+r9Z4rqgCE3ihh6UYXg9/r1k9VC9uydPtB7gA8rXBTUzonj59vJjSkpD
	yG9SizmY+Q5wlgUgZLNG/lHXWVHGGc+QZEvuHMQwPd0w==
X-Received: by 2002:a05:6000:1370:b0:34c:a95f:1114 with SMTP id ffacd0b85a97d-3504a7375ccmr8605004f8f.40.1715764836643;
        Wed, 15 May 2024 02:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3up2P0hHaTklD9gYmhk6xsllM9NPFPHX4graXN/12bVruf946hIdGyx5w4qTtIgCPxjVNNg==
X-Received: by 2002:a05:6000:1370:b0:34c:a95f:1114 with SMTP id ffacd0b85a97d-3504a7375ccmr8604981f8f.40.1715764835894;
        Wed, 15 May 2024 02:20:35 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bc99sm15849089f8f.11.2024.05.15.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:20:35 -0700 (PDT)
Date: Wed, 15 May 2024 05:20:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev, virtio-dev@lists.linux.dev
Cc: OASIS-virtio@connectedcommunity.org
Subject: [PATCH] README.md: update mailing list info
Message-ID: <a7999f18e2112605b167c623f9fe1ab67c535569.1715764807.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As approved by the TC, we are moving to a less formal
way of discussing the specification, on the mailing lists
provided by the Linux Foundation:

https://groups.oasis-open.org/higherlogic/ws/public/ballot?id=3820

Update README.md accordingly.

Use this opportunity to explain when and how to use each
mailing list.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 README.md | 80 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/README.md b/README.md
index 2bdf485..c06caf6 100644
--- a/README.md
+++ b/README.md
@@ -76,11 +76,12 @@ font packages.
 <dd>
 </dl>
 <h4>Providing Feedback</h4>
-Feedback must be provided the <strong>virtio-comment</strong> mailing list,
-and archived in the mailing list archives.
-<p>See <A
-HREF="https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio#feedback">
-https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio#feedback</A>
+Informal feedback is accepted through the <strong>virtio-comment</strong> mailing list,
+and is archived in <A HREF="https://lore.kernel.org/virtio-comment/">the mailing list archives</A>.
+To provide feedback, subscribe by sending mail to
+<HREF="mailto:virtio-comment+subscribe@lists.linux.dev">virtio-comment+subscribe@lists.linux.dev</A>,
+then after confirming you agree to the IPR sending your feedback to
+<HREF="mailto:virtio-comment@lists.linux.dev">virtio-comment@lists.linux.dev</A>.
 <p>Note that only plain text part of the message is archived, and all
 attachments are stripped. Accordingly, messages sent to the
 mailing list should use text/plain encoding and not
@@ -106,8 +107,38 @@ Signed-off-by: Name &lt;email&gt;<br>
 git format-patch -o proposal1/ HEAD~1..<br>
 ... generates a new directory proposal1/ and a file starting with 0001- ...<br>
 <p>
-git send-email --to=virtio-comment@lists.oasis-open.org proposal1/0001-*
+git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
 </code>
+
+<dl>
+<dt>When to use the virtio-comment mailing list:</dt>
+<dd>
+  questions and change proposals for the Virtio specification,
+  including the specification of basic functionality, transports and
+  devices.
+</dd>
+
+<dt>When <em>not</em> to use the virtio-comment mailing list:</dt>
+<dd>
+  questions and change proposals for Virtio drivers and devices
+  implementing the specification.
+  (please use the <A HREF="mailto:virtio-dev@lists.linux.dev"> virtio-dev mailing list</A> for this).
+</dd>
+
+<dt>To do:</dt>
+<dd>
+ send email preferably in text format (best for archiving).
+</dd>
+
+<dt>Not to do:</dt>
+<dd>
+<ul>
+<li> copy both virtio-dev and virtio-comment mailing lists (instead, pick one);
+<li> send full copies of the virtio spec (in any format).
+</ul>
+</dd>
+
+</dl>
 <h4>Note for TC Members</h4>
 <p>TC Members should review TC specific
 process rules under "Further Description of this Repository"
@@ -116,16 +147,43 @@ HREF="https://github.com/oasis-tcs/virtio-admin">https://github.com/oasis-tcs/vi
 
 </div>
 <h4>Implementation discussion</h4>
-Implementation discussion should take place on the <strong>virtio-dev</strong> mailing list,
-and be archived in the mailing list archives.
-<p>See <A
-HREF="https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio#feedback">
-https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=virtio#feedback</A>
+Implementation discussion takes place on the <strong>virtio-dev</strong> mailing list,
+and is archived in <A HREF="https://lore.kernel.org/virtio-dev/">the mailing list archives</A>.
+To participate in the discussion, subscribe by sending mail to
+<HREF="mailto:virtio-dev+subscribe@lists.linux.dev">
+virtio-dev+subscribe@lists.linux.dev</A>.
+After agreeing to the IPR, to participate in the discussion, send
+mail to <HREF="mailto:virtio-dev@lists.linux.dev">virtio-dev@lists.linux.dev</A>.
 <p>This is the correct list to copy on Linux virtio UAPI change proposals.
 <p>Note that only the plain text part of the message is archived, and all
 attachments are stripped. Accordingly, messages sent to the
 mailing list should use text/plain encoding and not
 have any attachments.
+
+<dl>
+<dt>When to use the virtio-dev mailing list:</dt>
+<dd>
+  questions and change proposals for Virtio drivers and devices
+  implementing the specification.
+</dd>
+
+<dt>When <em>not</em> to use the virtio-dev mailing list:</dt>
+<dd>
+  questions and change proposals for the Virtio specification,
+  including the specification of basic functionality, transports and
+  devices (please use the <A HREF="mailto:virtio-comment@lists.linux.dev"> virtio-comment mailing list</A> for this).
+</dd>
+<dt>To do:</dt>
+<dd>
+ send email preferably in text format (best for archiving).
+</dd>
+
+<dt>Not to do:</dt>
+<dd>
+copy both virtio-dev and virtio-comment mailing lists (instead, pick one).
+</dd>
+</dl>
+
 <h4>Use of github issues</h4>
 Note: according to the virtio TC rules, all official TC communication
 is taking place on one of the TC mailing lists.
-- 
MST

