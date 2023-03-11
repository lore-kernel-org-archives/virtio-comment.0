Return-Path: <virtio-comment-return-4871-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C8C61DA4
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:18:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 884BC87481
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:18:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E4D3986738
	for <virtio-comment@archiver.kernel.org>; Sat, 11 Mar 2023 21:18:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 763D3986727; Sat, 11 Mar 2023 21:18:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6064598687E
	for <virtio-comment@lists.oasis-open.org>; Sat, 11 Mar 2023 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xBcz8AlxOQilLcsmvj5o0w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678569499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmB83oTeEMlqGOyv7Adnkkwksgt9i7gzl2V2stLZx2U=;
        b=sDjqC92OfDPhg5Vu7UumNvo8E0UFJ7t3LUWv46m1ltlxqiPIF7aufDBt+k3IkZmgIx
         d8lXwHOJV/emzuB02a5+IWne3L0YMYKvLTp9YVikjY4Olms7yVSVExcpcmyjfjuq0f+t
         dELGrbpnpRBXh59jAOEkJkzWWJW1kGAOyalFcwaacvzjFBZOUCRIPtU5tUrW+j4a1k9v
         FX1l1A1oWUdTbTZ27ixCA+7xX3xLeM4l1eF18qzfhA7+C5Pqo/UV++ZeM1UK9o4zLAje
         5i/X9hGNwit5tagnQjWEWq/YE5/Uwb8jpn94Pl1a7yavjtvAGA/fAmO5m0KoQzrWoe83
         Mo+w==
X-Gm-Message-State: AO0yUKXum2QGGPctMa66TDp/LGGTdvlD8++tDdl62k1ToQ0SIIPypbaT
	R1E9jQrJIN0wasRV6AEPgbO/pB/YYRndTaKOHkcj9ZzlxRg4+nNc0dgVZWBQoXLkbBQymVQSZts
	FGk3L4Yt8RYplkx1FI+TjNF/hOb2yOFdAAw==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id bg34-20020a05600c3ca200b003eb3104efecmr6926425wmb.16.1678569499650;
        Sat, 11 Mar 2023 13:18:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9u4uq2syB+wOV1QIYHjN5Q8QFjeovcn4qweQpp3F+KUXPPKAXVjuY/UQYUO/SU2WHIZkFRWQ==
X-Received: by 2002:a05:600c:3ca2:b0:3eb:3104:efec with SMTP id bg34-20020a05600c3ca200b003eb3104efecmr6926414wmb.16.1678569499302;
        Sat, 11 Mar 2023 13:18:19 -0800 (PST)
Date: Sat, 11 Mar 2023 16:18:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230311161751-mutt-send-email-mst@kernel.org>
References: <20230310150519.115090-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230310150519.115090-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] virtio-net: Fix virtqueues spelling error

On Fri, Mar 10, 2023 at 05:05:19PM +0200, Parav Pandit wrote:
> Correct spelling from virtqueus to virtqueues.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

A minor cleanup Cornelia can you commit?

> ---
>  device-types/net/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 4cd89ca..960a2e4 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1438,7 +1438,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  Field \field{unclassified_queue} contains the 0-based index of
>  the receive virtqueue to place unclassified packets in. Index 0 corresponds to receiveq1.
>  
> -Field \field{indirection_table} contains an array of 0-based indices of receive virtqueus. Index 0 corresponds to receiveq1.
> +Field \field{indirection_table} contains an array of 0-based indices of receive virtqueues. Index 0 corresponds to receiveq1.
>  
>  A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>  
> -- 
> 2.26.2


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

