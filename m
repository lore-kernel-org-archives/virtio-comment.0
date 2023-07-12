Return-Path: <virtio-comment-return-6825-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B2EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 08:37:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E1A0A33991
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 08:37:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9A9A9867AC
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Jul 2023 08:37:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0284986660; Wed, 12 Jul 2023 08:37:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B949986661
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Jul 2023 08:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8djX-jGtN7y_BWUoAR_oAg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151024; x=1691743024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jtw/Pen4U2ZFXE8zotdoYuJqCnMON9/q4K36vHBkdvY=;
        b=kT6g85jAdCNUM5CI4Wnf4hRagNrKNOR9S0V+Qz08tReb187C3hi8zysRfxzQpUCW3C
         TdmmYAzhLO0ET+FIMIWoPw6krkufCvdtUEXMBMVWEfaV8PicbOHSdCSqV0ruw8bk3NYl
         /mR1ftaALLYvF3l0NPtY4U0k7OGnSA3bJaifPj6AoXhlgjFU6ZFXtBvVtMZqnPcyv8Q5
         lrjeSp8rIYJd7jdHMMocdH/rOMmb978O5PLOlbTGMO+jmXDjZkK6BaDZZFVaCD+Hc0hO
         S4bSPgFa/imKDb+n97PzgBNIr4Jbd52JsbYLVsqs/Yfli35GCOtEKyFzuyVZ9qh/HM02
         rXVg==
X-Gm-Message-State: ABy/qLb6NcS9B4LXX0paMwqevNsqa6KydoeOgmWet721U3FGunFMn0oR
	Dh5y1CKG52vMZz2CozWLnxlv+mdbnhD7S7LmmRcR1jS8FucMK2KeU0WpHGxxoteOoSSIR780QmP
	2d2ZM+qcpcxUkNzjXOpLN/SAU+BlUgASLyUWqLwje5+0bZdIqIxVln5hocYIeR5Cc1NoB2lNod8
	Zrz3tGQyTpcX1VSpxBtg==
X-Received: by 2002:a05:622a:2ca:b0:403:c2b9:1ef8 with SMTP id a10-20020a05622a02ca00b00403c2b91ef8mr2370082qtx.34.1689151024134;
        Wed, 12 Jul 2023 01:37:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSMAMDUmKgbdWdQqbBthpm/zU7BtZeTx46PYAtBlKATmNcQeurmZmCGh8GTGMsEZ7gwdfgiQ==
X-Received: by 2002:a05:622a:2ca:b0:403:c2b9:1ef8 with SMTP id a10-20020a05622a02ca00b00403c2b91ef8mr2370067qtx.34.1689151023807;
        Wed, 12 Jul 2023 01:37:03 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:37:00 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
Message-ID: <e577462c42778eba4f3fc96cc08038fd6a2b4390.1689090186.git.mvaralar@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [RFC PATCH] virtio-snd: improve PCM command lifecycle description

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

