Return-Path: <virtio-comment-return-5144-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D83C76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:03:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 86179604AE
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:03:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80645986400
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:03:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 76F129863D6; Mon,  3 Apr 2023 15:03:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 64605986468
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 15:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tFGTE7JJOayx3xv7v7UtDA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680534189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzplKRTHu/vMCvc4t33dvK+D04mJ7A3AvZe8fbWJ/Hw=;
        b=UKyjAuRaFeD9lMG3mqYQkzaMW/eRFjurDRQFchN92CSUMCbMQGnC1tNgMZt4x+NBQ7
         5Hk/0mkhxdayJBHiw94WRvYslSscMYfycuX2EjQxfq0MB990eQvqTL2w/8+mb7imLdpq
         PJkI5ZN5+29FH7uJHKbQa1Sk2VkJ+cgdUaLaVHRTVGOaHm3Ycepr2rt5IIh1i4fK+3VB
         ZdpkJAftnTrsxZz/NfsrbgIYFihih9KlzpMYi2hmu6i15jB41nZJATun6WWWZdBsYYMq
         1OTlJAFpxd8mD/TTnREJZDeHMvNg0gsd5n1dxW4VXu6u+1gzcy9JA13fpDfW0h6pLPmU
         myWw==
X-Gm-Message-State: AAQBX9f6LtCM7hxxBq262Sdm+cfvOi1i3SM0If3q3bzjzGjuYxWmv/ox
	HxAuEEfwZe0eQleJpCupEOT6g20sNup4hi/UfCsAvpuH1oA1V4co0E7RO2O4vceAsJP17NWA9zf
	foYxNmjUGGPmBfoI2YgXWt9vJmDTzIF5OFKQ0id5EytCA737a5LTkN/e6NeckvVjt+j1uw3rgNq
	VV8H4na6tDMJt4RW3K
X-Received: by 2002:a17:906:278a:b0:8b1:fc1a:7d21 with SMTP id j10-20020a170906278a00b008b1fc1a7d21mr39083359ejc.5.1680534189380;
        Mon, 03 Apr 2023 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350at1aJMML/Z3NZGIq/6S7hzFRR83vxe2/zhMW0tqvyjVbLiPduQyvmuypgKpVp3zSQ0RxAPVg==
X-Received: by 2002:a17:906:278a:b0:8b1:fc1a:7d21 with SMTP id j10-20020a170906278a00b008b1fc1a7d21mr39083317ejc.5.1680534189020;
        Mon, 03 Apr 2023 08:03:09 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:03:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <984303d7cd2413b00873a3cea803c2fa17108e83.1680533760.git.mst@redhat.com>
References: <cover.1680533760.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1680533760.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v11 01/10] virtio: document forward compatibility guarantees

Feature negotiation forms the basis of forward compatibility
guarantees of virtio but has never been properly documented.
Do it now.

Suggested-by: Halil Pasic <pasic@linux.ibm.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---

Changes in v11:
	make explanation about not using any unspecified bits
	more detailed as suggested by Cornelia and David
---
 content.tex | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/content.tex b/content.tex
index 0e474dd..8098988 100644
--- a/content.tex
+++ b/content.tex
@@ -114,21 +114,65 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 In particular, new fields in the device configuration space are
 indicated by offering a new feature bit.
 
+To keep the feature negotiation mechanism extensible, it is
+important that devices \em{do not} offer any feature bits that
+they would not be able to handle if the driver accepted them
+(even though drivers are not supposed to accept any unspecified,
+reserved, or unsupported features even if offered, according to
+the specification.) Likewise, it is important that drivers \em{do
+not} accept feature bits they do not know how to handle (even
+though devices are not supposed to offer any unspecified,
+reserved, or unsupported features in the first place,
+according to the specification.) The preferred
+way for handling reserved and unexpected features is that the
+driver ignores them.
+
+In particular, this is
+especially important for features limited to specific transports,
+as enabling these for more transports in future versions of the
+specification is highly likely to require changing the behaviour
+from drivers and devices.  Drivers and devices supporting
+multiple transports need to carefully maintain per-transport
+lists of allowed features.
+
 \drivernormative{\subsection}{Feature Bits}{Basic Facilities of a Virtio Device / Feature Bits}
 The driver MUST NOT accept a feature which the device did not offer,
 and MUST NOT accept a feature which requires another feature which was
 not accepted.
 
+The driver MUST validate the feature bits offered by the device.
+The driver MUST ignore and MUST NOT accept any feature bit that is
+\begin{itemize}
+\item not described in this specification,
+\item marked as reserved,
+\item not supported for the specific transport,
+\item not defined for the device type.
+\end{itemize}
+
 The driver SHOULD go into backwards compatibility mode
 if the device does not offer a feature it understands, otherwise MUST
 set the FAILED \field{device status} bit and cease initialization.
 
+By contrast, the driver MUST NOT fail solely because a feature
+it does not understand has been offered by the device.
+
 \devicenormative{\subsection}{Feature Bits}{Basic Facilities of a Virtio Device / Feature Bits}
 The device MUST NOT offer a feature which requires another feature
 which was not offered.  The device SHOULD accept any valid subset
 of features the driver accepts, otherwise it MUST fail to set the
 FEATURES_OK \field{device status} bit when the driver writes it.
 
+The device MUST NOT offer feature bits corresponding to features
+it would not support if accepted by the driver (even if the
+driver is prohibited from accepting the feature bits by the
+specification); for the sake of clarity, this refers to feature
+bits not described in this specification, reserved feature bits
+and feature bits reserved or not supported for the specific
+transport or the specific device type, but this does not preclude
+devices written to a future version of this specification from
+offering such feature bits should such a specification have a
+provision for devices to support the corresponding features.
+
 If a device has successfully negotiated a set of features
 at least once (by accepting the FEATURES_OK \field{device
 status} bit during device initialization), then it SHOULD
-- 
MST


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

