Return-Path: <virtio-comment-return-5249-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC239C7619A
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:22:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 87F8D330BC
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:22:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 764439865B7
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:22:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6F1199865A7; Wed,  5 Apr 2023 05:22:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D5709865A8
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Apr 2023 05:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: h9U7dOCgPlmZGn0hJ0OOOw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680672125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9S3GBM1aeHAkxQcQ0j6rF5Z6aymMqEzElXinUF2uc0=;
        b=Y2oQmljIb7x0y8dUlHv4KVttd1l406i+ZWjX2CbPJDoxkJZ3oFajU2mIybq6HP7NVr
         Bvbm123RfKMeqBYEflT/66X/E+I1qNHFxZZ2k2stpSfiss4PFMQumv2A1WNdM+ivqvOs
         KA/ZHYt0QKegalnUx2a/VBGrv5ATFAyRuHUS47u0q1scTb25G3WKpgchWaxMdCXruJr4
         m3AhBNIl/gKtEqq8u1DhgUKOfWnqWFDZuRMSKVqjwYt8V67jccTHOH/LC09RDU3NaJHR
         +TmN1rEBItakzYayN1N79M02Paa9+mGRLKu2GESkufzTMPvQi5pd39lm1qSEZq6R5e9A
         uNtw==
X-Gm-Message-State: AAQBX9c0QfScpmY+G9xIzrlGkNU+fHbJTBf+VnoMjNUBcLU4clSZN6lt
	oeou0pm3JleeSa8WvnrNa6Yv3NW4/oI8CqBRqbkTqCLtipwuF5DA5HMJeBUx5lbrOlzZQAv2/RG
	WxCqjz644zVHRs8dC8+Bc8ER1zQR0vDodAA==
X-Received: by 2002:a17:907:7751:b0:870:58ae:842e with SMTP id kx17-20020a170907775100b0087058ae842emr1809383ejc.24.1680672124863;
        Tue, 04 Apr 2023 22:22:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFC37NBCY7gEIoh4usDGsw6WYzJBaoWieAlhuiIaDvJ/4Xtb4zkgnlauBrwSNwf5rIAvZdiA==
X-Received: by 2002:a17:907:7751:b0:870:58ae:842e with SMTP id kx17-20020a170907775100b0087058ae842emr1809374ejc.24.1680672124602;
        Tue, 04 Apr 2023 22:22:04 -0700 (PDT)
Date: Wed, 5 Apr 2023 01:22:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
	pasic@linux.ibm.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com
Message-ID: <20230405011326-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
 <20230405010657.612529-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230405010657.612529-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v12 03/10] content: Rename confusing queue_notify_data
 and vqn names

This is not much of an improvement.

On Wed, Apr 05, 2023 at 04:06:50AM +0300, Parav Pandit wrote:
> Currently queue_notify_data register indicates the device
> internal queue notification identifier. This register is
> meaningful only when feature bit VIRTIO_F_NOTIF_CONFIG_DATA is
> negotiated.
> 
> However, above register name often get confusing association with
> very similar feature bit VIRTIO_F_NOTIFICATION_DATA.
> 
> When VIRTIO_F_NOTIFICATION_DATA feature bit is negotiated,
> notification really involves sending additional queue progress
> related information (not queue identifier).
> 
> Hence
> 1. to avoid any misunderstanding and association of
> queue_notify_data with similar name VIRTIO_F_NOTIFICATION_DATA,
> 
> and
> 2. to reflect that queue_notify_data is the actual device
> internal vq identifier, rename it to queue_notify_id.
> 
> Reflect vq identifier in the driver notification structure by renaming
> ambiguous vqn to vq_notify_id.
> 
> The driver notification section assumes that queue notification contains
> vq index always. CONFIG_DATA feature bit introduction missed to
> update the driver notification section. Hence, correct it.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> Some side notes:
> renaming vqn to vqnd is even more confusing because data is really the
> queue identifier.

Clear to whom?  Why do you think so? Marvell who pushed this feature
said they stick some kind of constant value there which matches what
their hardware expects. Sounds like a valid way to use this.
So no, not an identifier, and in any case "vq identifier" is a really
general and useful term, I would rather not burn it up on
a baroque feature that almost no one sets - for almost
everyone else this is simply vq index.

If you really insist on renaming this away from "vqn",
maybe vq_index_config_data will do, and we
can add a comment /* Either vq index or vq config data, previously named vqn */


> And NOTIFICATION_DATA really contains queue progress info (data).
> 
> (vqn - n is number or notification?, notification word in the
> notification structure does not make sense).
> 
> Hence above renaming.


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

