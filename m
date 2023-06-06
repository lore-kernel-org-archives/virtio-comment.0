Return-Path: <virtio-comment-return-6183-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB2C7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:50:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 94A1D44345
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 85FBE2AFF8; Tue,  6 Jun 2023 22:50:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4C23986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KZAaQJsjMUWAFurAjunJ6g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091788; x=1688683788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEd7gKpmFP5fo4SfUS18fL6iKpU6DEZG2EUxXv0jI4w=;
        b=HzPXI4be2HbYfunJm0F4dsYqfaDAh58q8jU7WsaGG9rnVoQh1kKcBoJPh0L8OByHAK
         PFDOnXgF8cqtSOxQayb2MQJoqAsZ7Y/FG2tmxZc0pITXrRMhe2Li5wrM6mjjyUpbzfFS
         Lo+4y9pHuxI5HprJXWulZJt5moCdx+oCyJty4yjARIMVmejMLveyXGCENEC0IY12sP55
         +k74iJdyA4JZxTokOykq7alCoZx8fEAciI7oI14GSzpNaaASy6tIEFUFrpE1XX39hE7D
         L9s6nnwDTCv+M1qx77Z6vVXTOdxCyICFTOq2hmF190xkPFSTBtRF7wm+wLPalrCjUHpT
         Wz0A==
X-Gm-Message-State: AC+VfDyDumOKpY+vqJWOluE62d1RYkYOV2yqfK2YROE4BwF4ZOOhPS+7
	yMqFTOX3jLXdMwLRii4fv8z8E8ET1gjcrDmbu8MsxMFAorqmkvEeFeNrXR7WVZQeKH4enpwFw9l
	WYdKx6pHiV1MvlseihNUBlJ558bsYXF/s5A==
X-Received: by 2002:a5d:6550:0:b0:30a:9014:838d with SMTP id z16-20020a5d6550000000b0030a9014838dmr2931286wrv.11.1686091788464;
        Tue, 06 Jun 2023 15:49:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KA/q8lMpPAFQz+ggn6mFfQP2EnzwfHF8ZFTp7xog+sRXQp6MoI0geQCfIuKo/7/S62+lX1Q==
X-Received: by 2002:a5d:6550:0:b0:30a:9014:838d with SMTP id z16-20020a5d6550000000b0030a9014838dmr2931280wrv.11.1686091788178;
        Tue, 06 Jun 2023 15:49:48 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:49:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	virtio@lists.oasis-open.org
Message-ID: <20230606184141-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 0/7] virtio net new
 features requirements

On Fri, Jun 02, 2023 at 01:02:58AM +0300, Parav Pandit wrote:
> Hi All,
> 
> This document captures the virtio net device requirements for the upcoming
> release 1.4 that some of us are currently working on.
> 
> I would like to capture if there are any other requirements linked to the
> features captured in this document to consider in the interface design.
> 
> The objectives are:
> 1. to consider these requirements in introducing new features
> listed in the document and work towards the interface design followed
> by drafting the specification changes.
> 
> 2. Define practical list of requirements that can be achieved in 1.4
> timeframe incrementally and also have the ability to implement them.
> 
> This is not a specification document. It is a pre-work document
> that helps to understand the draft specification addressing these
> requirements.


thanks for write up! great start.

some things look a bit more like a specific design that
you have in mind. we need to take a step back and include
the actual requirement too. it's ok to list a design idea
too (you call them examples here).

splitting different areas in separate files might be a good idea.

some things will require virtio core extensions.

I have a generic comment about limitations such as alignment
physically contiguous etc. It's natural for hardware vendors
to try and push complexity to software, but in the end this
might just shift overhead to driver/TCP stack. 
Please try to add motivation with each requirement.
I pointed out some of such cases as "weirdly specific".




> Please review.
> 
> Parav Pandit (7):
>   net-features: Add requirements document for release 1.4
>   net-features: Add low latency transmit queue requirements
>   net-features: Add low latency receive queue requirements
>   net-features: Add notification coalescing requirements
>   net-features: Add n-tuple receive flow steering requirements
>   net-features: Add packet timestamp requirements
>   net-features: Add header data split requirements
> 
>  net-workstream/features-1.4.md | 224 +++++++++++++++++++++++++++++++++
>  1 file changed, 224 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
> 
> -- 
> 2.26.2
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 


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

