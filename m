Return-Path: <virtio-comment-return-9157-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D32C5478C
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 11:27:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 79C5D42A68
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 11:27:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59F24986530
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 11:27:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 42D71983D68; Tue, 27 Feb 2024 11:27:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 339059863DE
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Feb 2024 11:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5YN-rDzSMySfgrTDtClUMg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033259; x=1709638059;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jtw/Pen4U2ZFXE8zotdoYuJqCnMON9/q4K36vHBkdvY=;
        b=O+Ty8ZGLmkfZjXdtBoY0k4ylyW4/Bs0arEZf1uDtroHvNhH4Iwvk+e3KT/93jECODT
         fHT0dK7TAUD9eesRo/vaGPgRdhK1lqQPhJ0VJRKxytThNLYzD/dWVAF5pvrxJqohk9UR
         zl3N8EczJ4UfIXC+p8aFYaJrwA86dPMHlU5Pz7gWf0fNm9HE3p1nfIuh2hIqkv2Cx8Mw
         ql87EM0LvBGO7Y1qvXs2GKJgNivhHLpK4bUPe7OD7KWJ/h+drWaDqPzZPbj0LdEcnwKp
         lpFXe66F+/w3iw6FtkSV/B2xgBEvdcT425WTMduMbyzUz+Zf4LG9turvOrxu1WYRqgfT
         P7oA==
X-Gm-Message-State: AOJu0YxKKqDSUvg1uwB2pdp83zEgV7e9Nr02CdLriA9PbmSTEO0nM1K2
	N8oUZS8xTMZtcDhMZKV5zk2m9oUBSJA+vrzNz93+OuR7IIytdSEwOqw3WuLq6mJXfyBArpVxMly
	VHvlKc1uns7tzO4mdfGzTV7I55CouIK/UvtXSlQ+mwe4lQkdB3AXuuOfpWCFkV8+hOu/YC7qLC0
	qjVo4scFy8+aw7XDCm1MREHCg9Pvvd22KYO8dcXdDzTdphTODq86OkJUs=
X-Received: by 2002:a05:6214:418c:b0:68f:e774:d57a with SMTP id ld12-20020a056214418c00b0068fe774d57amr3082840qvb.27.1709033259068;
        Tue, 27 Feb 2024 03:27:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk2CQk9EZUqs2Wt+mN0Ti2EDkokr+CbaOIgV2QGkn1UxA6Ra2vVHAZdZw1/CfzR+Qiw+jAwA==
X-Received: by 2002:a05:6214:418c:b0:68f:e774:d57a with SMTP id ld12-20020a056214418c00b0068fe774d57amr3082822qvb.27.1709033258771;
        Tue, 27 Feb 2024 03:27:38 -0800 (PST)
Date: Tue, 27 Feb 2024 12:27:35 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com, mvaralar@redhat.com
Message-ID: <Zd3HJzN9fG6Pg0lR@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] virtio-snd: improve PCM command lifecycle description

The PCM command lifecycle can be described as a state-machine in which
the switching between states is triggered by commands. This commit
explicitly presents the different states and the commands that are
allowed in a given state. This commit leaves to the implementation the
decision the state reached depending on the command.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/sound/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..55e93af 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
 \end{description}
 
-\paragraph{PCM Command Lifecycle}
+\paragraph{PCM Command Lifecycle State Machine}
 
-A PCM stream has the following command lifecycle:
+A PCM stream can be represented by a state-machine made up of the following
+states:
+\begin{description}
+\item SET PARAMETERS
+\item PREPARE
+\item START
+\item STOP
+\item RELEASE
+\end{description}
+
+A command triggers the transition between these states. To what state to switch
+depends on the implementation. Depending on the state, only certain commands
+are valid. An error may occur if an invalid command is triggered.
 
 \begin{enumerate}
 \item SET PARAMETERS
@@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 The driver negotiates the stream parameters (format, transport, etc) with
 the device.
 
-Possible valid transitions: set parameters, prepare.
+Possible valid commands: set parameters, prepare.
 
 \item PREPARE
 
 The device prepares the stream (allocates resources, etc).
 
-Possible valid transitions: set parameters, prepare, start, release.
+Possible valid commands: set parameters, prepare, start, release.
 
 \item Output only: the driver transfers data for pre-buffing.
 
@@ -421,7 +433,7 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 
 The device starts the stream (unmute, putting into running state, etc).
 
-Possible valid transitions: stop.
+Possible valid commands: stop.
 
 \item The driver transfers data to/from the stream.
 
@@ -429,13 +441,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
 
 The device stops the stream (mute, putting into non-running state, etc).
 
-Possible valid transitions: start, release.
+Possible valid commands: start, release.
 
 \item RELEASE
 
 The device releases the stream (frees resources, etc).
 
-Possible valid transitions: set parameters, prepare.
+Possible valid commands: set parameters, prepare.
 
 \end{enumerate}
 
-- 
2.41.0


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

