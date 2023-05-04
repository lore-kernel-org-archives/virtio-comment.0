Return-Path: <virtio-comment-return-5757-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D04EC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2F682F90EB
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2ACC19866B5
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22ACC98663F; Thu,  4 May 2023 08:21:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1311E9866A4
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188484; x=1685780484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSxvdEsnnZAXjH+PI3GuC6H1e9MhPXRdNXPFxEMdp+A=;
        b=J1Ter8O5+CFATHXbQhD8V6eevibGuJ4Ly0ZoKAx7hgnS44Ezovj16tu7hquQd2X0Jf
         YBWiEbVIJiR67nKW5a+EFXDKH8Gvz6ITvtUr3OuqFANtd3lstW6RoMzCJxJDJ4fDMpVY
         5UBW2WwG0ZbVf6XByzA0E+G+0IU+p/YwuRLG1xRpVVNes7OiFg/GPMpIiiMRSWQE6hzV
         u9Q7P4ly8QESi8vIhTCVIMP2f5zorTbgbVRXJECxSbCTqgTnf5Pa+nC6xefcknY4zF6X
         5pvg3uj1/n6WEBkvpMz3JL68ba7WY/DASQ3L3Xzo5hSa0RU7ICr9SsZEar25P6IsB4G7
         3NXA==
X-Gm-Message-State: AC+VfDx/8r/Jd4sY1X4wWVqNmZUo1YtNUn3qw5sNFJuGQvDJxbX3wXlA
	GzeCqnwueF/c8Q2dAE7no/QkzA==
X-Google-Smtp-Source: ACHHUZ6guwZVX/2gTzKzLsonfqdHfVETPyqFtha0doYDiJnaJQzmbAydXg2jXVHLuOig8jcmZoAXBA==
X-Received: by 2002:a05:6a21:999a:b0:fc:8dfb:3195 with SMTP id ve26-20020a056a21999a00b000fc8dfb3195mr1728432pzb.23.1683188484567;
        Thu, 04 May 2023 01:21:24 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: parav@nvidia.com,
	mst@redhat.com,
	stefanha@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	xinhao.kong@duke.edu,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Thu,  4 May 2023 16:19:00 +0800
Message-Id: <20230504081910.238585-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 01/11] transport-fabrics: introduce Virtio Over Fabrics overview

In the past years, virtio supports lots of device specifications by
PCI/MMIO/CCW. These devices work fine in the virtualization environment.

Introduce Virtio Over Fabrics transport to support "network defined
peripheral devices". With this transport, Many Virtio based devices
transparently work over fabrics. Note that the balloon device may not
make sense. Shared memory regions won't work.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 content.tex           |  1 +
 transport-fabrics.tex | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 transport-fabrics.tex

diff --git a/content.tex b/content.tex
index cff548a..f899c3a 100644
--- a/content.tex
+++ b/content.tex
@@ -582,6 +582,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
 \input{transport-ccw.tex}
+\input{transport-fabrics.tex}
 
 \chapter{Device Types}\label{sec:Device Types}
 
diff --git a/transport-fabrics.tex b/transport-fabrics.tex
new file mode 100644
index 0000000..0dc031b
--- /dev/null
+++ b/transport-fabrics.tex
@@ -0,0 +1,31 @@
+\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
+
+This section defines specification to Virtio that enables operation over other
+interconnects. A central goal of Virtio Over Fabrics is to maintain consistency
+with the PCI device, so Virtio based devices transparently work over PCI or
+fabrics.
+
+Virtio Over Fabrics uses reliable connection to transmit data, the reliable
+connection betweens two rules:
+
+\begin{itemize}
+\item An initiator functions as an Virtio Over Fabrics client. An initiator
+typically serves the same purpose to a machine as a Virtio device, issues
+commands to remote side.
+\item A target functions as an Virtio Over Fabrics server. An target typically
+handles commands from the initiator side and responses completions.
+\end{itemize}
+
+Virtio Over Fabrics has the following differences from the PCI based
+specification:
+
+\begin{itemize}
+\item Instead of memory sharing mechanism of virtqueue, there is a one-to-one
+mapping between virtqueue and the reliable connection which executes the vring
+data transmission.
+\item An additional control connection is required to execute control commands
+which is similar to read/write register on a PCI device.
+\item Virtio Over Fabrics does not define an interrupt mechanism that allows an
+initiator to generate a host interrupt. It is the responsibility of the host
+fabric interface to generate host interrupts.
+\end{itemize}
-- 
2.25.1


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

