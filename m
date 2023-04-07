Return-Path: <virtio-comment-return-5312-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E72C76196
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 86A9A2B151
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:44:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EC5A9865DE
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:44:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 76688983F7B; Fri,  7 Apr 2023 11:44:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67B869865D7
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 11:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vrHIkzo_O7CEnzr_G_ncqQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680867887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd0McE1Pmqo31JqLuxc+//gxA8SQH8R9CaWWacnuXp8=;
        b=IlDGKsRAM4w7CTSWIiq5n+BuxaxEsctyuSEsEC3oRjy3PJtI8gcaRut9mdtaA64lvB
         vsuVVoHODofsOUS8jJ93+VGHU72Jm1fKNI9iQeHi2WioBSnft9AUIOk7kSlGtK2MKrVA
         oqfT4Orm68msn5DDiFTwGMmr4lt6erTd97e1R/JircfiLjibYhrALVLIBkevQYtjhPMy
         O9qwVGAk4bF+nsOQ/LLnneFEqkajroYo19sILP6lIag05UTxLP4uNhL80vnhD4iziyjs
         qpdLxJAUEvbsm8G8jZDtRCJCo7MKC4WcN7RklliyiDMcCRJhME6n+uyZo+T8/BN2mErI
         l96A==
X-Gm-Message-State: AAQBX9fOiuRJuGlXMH5bLeEX3RPJ2NosBNflem86Rcf8ekazM4Bh6rth
	E8NIzvfOdiT3QiQ5+xY3WYTLdIqvLIxoy9es4omaMuxkAL/XSyr+l81bxY86/gS1ldGnVc7pGkl
	v4taD5EoKJQLv6Dw6CI/t/DqrBPptFoXMew==
X-Received: by 2002:adf:fac5:0:b0:2cd:de25:1c76 with SMTP id a5-20020adffac5000000b002cdde251c76mr1093066wrs.17.1680867887617;
        Fri, 07 Apr 2023 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZCWuep27lmMgceD/slFC9zf/Dl6W9HvGNiq4uDINBhc/4r5y6EUI/5+EaR8BcMmviMv2qc5g==
X-Received: by 2002:adf:fac5:0:b0:2cd:de25:1c76 with SMTP id a5-20020adffac5000000b002cdde251c76mr1093057wrs.17.1680867887320;
        Fri, 07 Apr 2023 04:44:47 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:44:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230407074355-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
 <20230405010657.612529-4-parav@nvidia.com>
 <20230405012723-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C1EC27F79A87218C3767DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C1EC27F79A87218C3767DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v12 03/10] content: Rename confusing
 queue_notify_data and vqn names

On Wed, Apr 05, 2023 at 01:21:40PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, April 5, 2023 1:30 AM
> 
> 
> > VIRTIO_F_NOTIF_CONFIG_DATA is such a narrow usecase, I don't like burning
> > "vq identifier" on this. How about we just say something along the lines of:
> > 
> Ok. 
> > 
> > When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, this
> > notification involves sending either the virtqueue index or the virtqueue config
> > data to the device (method depending on the transport).
> > 
> > And then "the data sent is a device supplied virtqueue config data".
> > 
> Sounds fine. I will reword it.

FWIW I like this more than coming up with a cookie term, it is definitely a
more conservative approach.

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

