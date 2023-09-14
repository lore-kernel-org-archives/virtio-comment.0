Return-Path: <virtio-comment-return-7422-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B12EDE9A4
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:30:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3BC72AEDF
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:30:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A10DB986649
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:30:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9307A98402B; Thu, 14 Sep 2023 11:30:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A73098663D
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 11:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 63KTfIWKNsS6bReVfySCjw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694691007; x=1695295807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxpiCpSlW17v6RGdS9BH6kLJKP3t/hJwe1wjhApUyt8=;
        b=Qpb8nTBMjDiD0mLvk0nRsm1kO06KVgyD3Y3r+HyCtK4NjGX3WPF8/uJA89Ut8jMCVp
         W9GNQa0wgkJECatZ0iQDCGQfLcSTtT7Sx7kN/ieElae0ccfgXP2JKppj98qDBwL0RWSq
         knH0fvHTl968bd1UmTYdlbleAVceDP24vc8V2OZZQGcsHpnp24vxzUw+luLtPlCxBTpU
         bpoTXwIy3DBimR/d24P9T0gSGmKx2htdC+uIJFGhIEELJRgnc086XgEE4+zk2KZn453L
         2DMgcC098zCP2wSPLJbXKp58drgpYJ9/0QrIgRT/XsjpoSigXlWmc/BkyfkUPeTJDp86
         E/xQ==
X-Gm-Message-State: AOJu0YyRhoeDuUqA3HgsG1Q83PiKLZa3IsMnaYlZvWPbXkiPSkiYvaC9
	g3i/xsLrkj8ECXYYKaOt+Przk1H7NB269dbcQaSjfWXPC/rVAaDh8d3lH9M9s3EZj9PrEAbnpkE
	DwbOLfzJG8boYqE2zvOSaNRV6xoyLyojWdw==
X-Received: by 2002:a17:907:2c6a:b0:9a1:edfd:73bb with SMTP id ib10-20020a1709072c6a00b009a1edfd73bbmr4394778ejc.47.1694691007402;
        Thu, 14 Sep 2023 04:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYTo14pDl3Zp85YnwnGh15JInz0+kIhRJ0VPwUWR+A5DKUXTl7ld59dqMeEh9vcOzCJUMdtQ==
X-Received: by 2002:a17:907:2c6a:b0:9a1:edfd:73bb with SMTP id ib10-20020a1709072c6a00b009a1edfd73bbmr4394763ejc.47.1694691007095;
        Thu, 14 Sep 2023 04:30:07 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:30:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230914072857-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-4-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-4-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 3/5] virtqueue: constraints for virtqueue state

On Wed, Sep 06, 2023 at 04:16:35PM +0800, Zhu Lingshan wrote:
> This commit specifies the constraints of the virtqueue state,
> and the actions should be taken by the device when SUSPEND
> and DRIVER_OK is set
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  content.tex | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 0fab537..9d727ce 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -594,6 +594,25 @@ \subsection{\field{Used State} Field}
>  When VIRTIO_RING_F_PACKED is not negotiated, the 16-bit value of \field{used_idx}
>  is always 0
>  
> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated but VIRTIO_RING_F_PACKED not been negotiated,
> +the driver SHOULD NOT access \field{Used State} of any virtqueues, it SHOULD use the
> +used index in the used ring.
> +
> +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated, the device SHOULD only accept setting
> +Virtqueue State of any virtqueues when DRIVER_OK is not set in \field{device status},
> +or both of DRIVER_OK and SUSPEND are set in \field{device status}.
> +Otherwise the device MUST ignore any writes to Virtqueue State of any virtqueues.
> +
> +If VIRTIO_F_QUEUE_STATE have been negotiated, when SUSPEND is set,
> +the device MUST record the Virtqueue State of every enabled virtqueue
> +in \field{Available State} and \field{Used State} respectively,

record how?

> +and correspondingly restore the Virtqueue State of every enabled virtqueue
> +from \field{Available State} and \field{Used State} when DRIVER_OK is set.

when is that?


> +
>  \input{admin.tex}
>  
>  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
> -- 
> 2.35.3


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

