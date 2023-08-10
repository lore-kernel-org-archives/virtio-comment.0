Return-Path: <virtio-comment-return-7066-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F77C001DB
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 08:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A05AAC6226
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 08:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 792E69864D2
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 08:50:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 618D69864C1; Thu, 10 Aug 2023 08:50:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34BB49864C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Aug 2023 08:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XJ9qB1VHMlaP41QzXXk96Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691657342; x=1692262142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMZGKHx8//utTT47WfxEzxAVCBzC12za5FrRAACg+x4=;
        b=ZgaOUgWfHK/PXlRccdOJBDg029qa1LUuo4ehKsdfbkQLKqo/Xri3rTedJt6tfpKmHT
         bgLFkH0S7UsoD+b0kyUS9ISZioknm8KIFbMPIMOqGrIqJNVFDsXlM2+v3yptkhS6r14A
         9FbB7kXwatY3DR3NVvVHfpW6kFn0wQ6rIg796UI8ObRlRzCC+7Xsu4PRaCizTRB6Wq7U
         XPsDW5imXOQFGq/SfOh91CUeD0wPgxCCsXyiFAnkpgNre0uqXVJm6LtVwbPOk+UPoFyy
         wTpaKqHDe7VgpCkkesLmw6Vn2jNz8FvcskqU4aT6P5aMYgivP3TD9+JMAgHSyaehZstC
         mG2Q==
X-Gm-Message-State: AOJu0YwbiQlWjHgXsMs6GeQuGKqFNN8zaIu8H+J4OBbdP7gx/0phBQ67
	TGYR+gOeIETT0Jtv9mb1gDBBX51bwSq7a488HGMnRXTeDNppJE9qdckEDIL9wyKo2geW8IEL+EJ
	7MwY4bbtr0GRgkISE0z2dJIbNSouYe5aj5VYt9Sv73sXsgTZWVLyjXZfq7RFUqyPOztl1rtGvzw
	2gr5LKS17zKTL+0R4uyA==
X-Received: by 2002:adf:fa81:0:b0:314:2f3e:dca5 with SMTP id h1-20020adffa81000000b003142f3edca5mr1163041wrr.28.1691657342407;
        Thu, 10 Aug 2023 01:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeHV8UXqOEcJQsYHGIOkU7QcpM/+V583PxHjLJbJXYISFEHOC3F0/K1rxQJ98qOpkUwjr/cQ==
X-Received: by 2002:adf:fa81:0:b0:314:2f3e:dca5 with SMTP id h1-20020adffa81000000b003142f3edca5mr1163021wrr.28.1691657342031;
        Thu, 10 Aug 2023 01:49:02 -0700 (PDT)
Date: Thu, 10 Aug 2023 10:48:59 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
Message-ID: <ZNSke4Vs0jUSr3Jb@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [RFC PATCH] virtio-sound: use 'data buffer' instead of 'buffer'

This RFC replaces the wording 'buffer' with 'data buffer' when referring
to the payload of PCM messages. The virtio specification defines the
word buffer as a set of zero or more device-readable
physically-contiguous elements followed by zero or more
physically-contiguous device-writable elements. In the virtio-sound
section, the word is used only for the data or payload in a request. In
this case, the data buffer is sent together with a header, i.e.,
device-readable, and the status, i.e., device-writable. To not get
confused with the main definition, this rfc replaces those usages
with the wording 'data buffer'.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/sound/description.tex | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..97151fa 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
 
 \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device Operation / PCM IO Messages}
 
-An I/O message consists of the header part, followed by the buffer, and then
-the status part.
+An I/O message consists of a buffer that contains a header part, followed by
+the data buffer, and then the status part.
 
 \begin{lstlisting}
 /* an I/O header */
@@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 \item[\field{latency_bytes}] indicates the current device latency.
 \end{description}
 
-Since all buffers in the queue (with one exception) should be of the size
+Since all data buffers in the queue (with one exception) should be of the size
 \field{period_bytes}, the completion of such an I/O request can be considered an
 elapsed period notification.
 
 \paragraph{Output Stream}
 
-In case of an output stream, the header is followed by a device-readable buffer
-containing PCM frames for writing to the device. All messages are placed into
-the tx queue.
+In case of an output stream, the header is followed by a device-readable data
+buffer containing PCM frames for writing to the device. All messages are placed
+into the tx queue.
 
 \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Device / Device Operation / PCM Output Stream}
 
 \begin{itemize}
-\item The device MUST NOT complete the I/O request until the buffer is totally
+\item The device MUST NOT complete the I/O request until the data buffer is totally
 consumed.
 \end{itemize}
 
@@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 
 \begin{itemize}
 \item The driver SHOULD populate the tx queue with \field{period_bytes} sized
-buffers. The only exception is the end of the stream.
-\item The driver MUST NOT place device-writable buffers into the tx queue.
+data buffers. The only exception is the end of the stream.
+\item The driver MUST NOT place device-writable data buffers into the tx queue.
 \end{itemize}
 
 \paragraph{Input Stream}
 
-In case of an input stream, the header is followed by a device-writable buffer
+In case of an input stream, the header is followed by a device-writable data buffer
 being populated with PCM frames from the device. All messages are placed into
 the rx queue.
 
@@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Device / Device Operation / PCM Input Stream}
 
 \begin{itemize}
-\item The device MUST NOT complete the I/O request until the buffer is full.
+\item The device MUST NOT complete the I/O request until the data buffer is full.
 The only exception is the end of the stream.
 \end{itemize}
 
@@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 
 \begin{itemize}
 \item The driver SHOULD populate the rx queue with \field{period_bytes} sized
-empty buffers before starting the stream.
-\item The driver MUST NOT place device-readable buffers into the rx queue.
+empty data buffers before starting the stream.
+\item The driver MUST NOT place device-readable data buffers into the rx queue.
 \end{itemize}
 
 \subsubsection{Channel Map Control Messages}\label{sec:Device Types / Sound Device / Device Operation / Channel Map Control Messages}
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

