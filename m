Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7ED626DF
	for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715766804; cv=none; b=D8NPBwVRJto7PCLBxNF37ABFqWy/hSWIWjUzpuhtTII6MsAgp6MafjmEENdyGzEUKlJBlDFaiXr1Wq+eDkTKTMbS9RWFeLbjV7K8CzCAs9A312G55x0Bye7VFlLy22JTEaIiXklz18b1hQGdh3vuhQRbxR55YN9oNzqm5scEy50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715766804; c=relaxed/simple;
	bh=H+V5gaJvfxaHXLaQbROyL060rtxp+JMMbufRuqux0EU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvqNl/rTySQNsDWtRRxXjewfOEvNtBKbTRslPIP0Iv6TxbuFV7+LjrAfBoT6zTl6lJPL15InotIgMTutsCqpHsBHV6T6Eo+ta7bzZ7Nn8VJTAVk7pqgxiyO8R63TS8Nyr6lGacsVRbq7Zhtr5cve4qLQbSoC18MXVkq1gx0Htu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3t7tPgA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3t7tPgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715766801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=75kPqjs//3ZxY02Ieg/A/CfLdA2jgPco6jZjzZshYkw=;
	b=U3t7tPgAB/SoLxNpUcM7SlrC5sBA8RubyfSzKJDsfRb4TkIasLSUF4QFrtu3EBYM7z229t
	9eRBbEtzww7o6ws5z76U8mxl60lRdwSw77TQGjZoOBKf/JuQ1xIVXZ6m9KbPHPxwTmNsTm
	SJGuJn+peYDJMupJ9b65zv+F2+DxvZo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-y_zvPzirPkaVHoc48d-DmA-1; Wed, 15 May 2024 05:53:20 -0400
X-MC-Unique: y_zvPzirPkaVHoc48d-DmA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34fcf649d5dso3432522f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 02:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766799; x=1716371599;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75kPqjs//3ZxY02Ieg/A/CfLdA2jgPco6jZjzZshYkw=;
        b=k+2CSmDZBqk0R113FmU4XBP5KWtI9F3O4xTe0hBG0wBUUG5yoVe82Gr0ofKzMOUj0M
         6SBlaJVBvrky/C//sdWQYTfLKRk68wo2KemZKK3zuSwDYwDbCAi/Oc/sxE9djtQAI0d6
         3crY81cijS1kV35lEnZb/xY9IyNSN7LsBItDoo4hxnkheU2LHdbC0/NRixFFPJid8tdW
         CrCKVjAAyRQ4EUN5yVe880J17c82/pze99C7pzzgo5DVifrrOR07W9E7b6yBN1rPiGYa
         1E/Pj35kawFwv37GBRpWoKUXHGDGLrqShAuvGfJWB4TJVGYrY9PjT9tv+wUgIrsrfaCE
         XM4g==
X-Gm-Message-State: AOJu0YwUNLDZFPMmaz5TjOaJMju8DJgQyPxxq8KY6GyjfNZwLlEsXlEZ
	b7OLBBYUo5d3gVR4DTaXxrCqxZL8fwE35TfeRPcXOlNJlEU00tnlDvUWZI43WueHsj7V9IgQp1E
	PHjzklvzeLJd/faYMGUf0WcK66K+S1i0I4LYoGwKKuXNxVh6sIA5vMwBcd6Mi7d/K0xy0cgFQEi
	hQT5yp63h9FJrCqvKz0lm/FoN6bR37YMPqJe4/qwMc0g==
X-Received: by 2002:a05:6000:183:b0:34d:990a:e4cb with SMTP id ffacd0b85a97d-3504a737f1emr11743797f8f.36.1715766798546;
        Wed, 15 May 2024 02:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBp3dxI2TbLlYUZwPY9qVXjaENqbh2o0DtrtKlCGl1lUKwVVIFGGps6Yw7IuBG/qgJjzWZAw==
X-Received: by 2002:a05:6000:183:b0:34d:990a:e4cb with SMTP id ffacd0b85a97d-3504a737f1emr11743771f8f.36.1715766797686;
        Wed, 15 May 2024 02:53:17 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b89583dsm16082979f8f.33.2024.05.15.02.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:53:17 -0700 (PDT)
Date: Wed, 15 May 2024 05:53:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev, virtio-dev@lists.linux.dev
Subject: [PATCH v3] README.md: update mailing list info
Message-ID: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
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

Update README.md, CONTRIBUTING.md and newdevice.tex accordingly.

Use this opportunity to explain when and how to use each
mailing list.

Oh yes, and device numbers are reserved through virtio-comment
not through virtio-dev. Correct that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v3:
	update CONTRIBUTING.md and newdevice.tex
changes from v2:
	Use this opportunity to explain when and how to use each mailing list.

 CONTRIBUTING.md |  2 +-
 README.md       | 80 ++++++++++++++++++++++++++++++++++++++++++-------
 newdevice.tex   |  3 +-
 3 files changed, 72 insertions(+), 13 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 1330a98..ee7318e 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -10,7 +10,7 @@ in the TC's technical activity is invited to <a href="https://www.oasis-open.org
 (Member, Voting Member, Persistent Non-Voting Member; Chair, Secretary...)</p>
 
 <p>Persons who are not TC members are invited to open issues and provide comments using this repository's <a href="https://github.com/oasis-tcs/virtio-spec/issues/new">GitHub Issues</a> tracking facility or using the
-TC's <a href="https://www.oasis-open.org/committees/comments/index.php?wg_abbrev=virtio">comment list</a>.  All such content created in GitHub Issues and/or posted to the TC's <a href="https://lists.oasis-open.org/archives/virtio-comment/">archived comment list</a> is governed by the terms of the <a href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>.</p>
+TC's <a href="mailto:virtio-comment+subscribe@lists.linux.dev">comment list</a>.  All such content created in GitHub Issues and/or posted to the TC's <a href="https://lore.kernel.org/virtio-comment/">archived comment list</a> is governed by the terms of the <a href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>.</p>
 
 <p><b>Use of Contributions</b>.  As with all OASIS Technical Committee assets (TC <a href="https://wiki.oasis-open.org/">Wiki</a>, TC <a href="https://issues.oasis-open.org/secure/Dashboard.jspa">Issues Tracker</a>, TC <a href="https://lists.oasis-open.org/archives/">General Discussion List archives</a>, TC <a href="http://docs.oasis-open.org/">OASIS Library</a> assets), content placed into this GitHub repository is visible and publicly accessible.  Subject to applicable <a href="https://github.com/oasis-tcs/virtio-spec/blob/master/LICENSE.md">licensing</a> rules, the repository content may be re-used freely, including the creation and publication of derivative works.</p>
 
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
diff --git a/newdevice.tex b/newdevice.tex
index 28e1c7b..ed0124b 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -29,7 +29,8 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 \section{What Device Number?}\label{sec:Creating New Device Types / What Device Number?}
 
 Device numbers can be reserved by the OASIS committee: email
-virtio-dev@lists.oasis-open.org to secure a unique one.
+virtio-comment@lists.linux.dev (after subscribing through
+virtio-comment+subscribe@lists.linux.dev) to secure a unique one.
 
 Meanwhile for experimental drivers, use 65535 and work backwards.
 
-- 
MST

