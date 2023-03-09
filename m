Return-Path: <virtio-comment-return-4849-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC8C61DA4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 16:53:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EDB431EAEC
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 16:53:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2E1798671A
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 16:53:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DB4A898650A; Thu,  9 Mar 2023 16:53:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA0F89866FB
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qumeSMTwPlK_tVy5NS4HiQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678380818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUMv+BQZZG0bXbwaHh0UMk4InwdMHaib1FIqCOqa1KU=;
        b=kBsGvGAE6AAiZONvoLOmCvJ05sQp5MRT4yCOFbpowrrrWFRbjF3eJxWibWEaqHRawL
         Xbwk2jZ00yx/U2IB7YuTiSZ8Wj0V1FoAPlvhixbQEfZpYnf+pJrrI9o9A/A3CeosMlim
         BoxKI4HJec+8oXwin30l/CcSH7OpBDr4g3m4dpXK4IjRsVwcz9LGvONgMjSQ611f1MJr
         kQX2JJWMb1qcL/g62z79LSBXfrIRq3AfayWmVnnUYrdoG8cvIZXsBLD+BlqXnqvW2sGa
         tik9ZogfsCfuA6U/g2bvm6ABM8TtN1HvzPX8HKClkPGgtXz7eQYi8Sbin85bY/m65pCu
         MoZg==
X-Gm-Message-State: AO0yUKVss22F0/0u41/JmwRmCtZQpxHWQ63gF11BxSQQa6JpGt/ENNvd
	PGzVCFl6i/9r98IY2K/jd5w78rAT0oSU8wpncYBsVEtofLwnD9H2d09yl0GF3cKeEeBUOKftETk
	83H1NE6qBlwYLbsRF31GOLPmMrG5W8PE5Rw==
X-Received: by 2002:adf:e543:0:b0:2c7:d7c:7d0 with SMTP id z3-20020adfe543000000b002c70d7c07d0mr18002134wrm.22.1678380818566;
        Thu, 09 Mar 2023 08:53:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+teVU5PTdZ6uHa8U8q8gJ00kaNnMkcFJltwYhF7bbjiu+5N/kx8ChjuT0X3ElifWXnH3n0+Q==
X-Received: by 2002:adf:e543:0:b0:2c7:d7c:7d0 with SMTP id z3-20020adfe543000000b002c70d7c07d0mr18002119wrm.22.1678380818302;
        Thu, 09 Mar 2023 08:53:38 -0800 (PST)
Date: Thu, 9 Mar 2023 11:53:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230309115110-mutt-send-email-mst@kernel.org>
References: <20230223054624.168042-1-parav@nvidia.com>
 <87a60z5wes.fsf@redhat.com>
 <20230301182207.23f995cd.pasic@linux.ibm.com>
 <20230301123044-mutt-send-email-mst@kernel.org>
 <87a60vmbub.fsf@redhat.com>
 <20230303023949-mutt-send-email-mst@kernel.org>
 <20230303224937.62fe64b9.pasic@linux.ibm.com>
 <20230305043948-mutt-send-email-mst@kernel.org>
 <20230309174650.7093f020.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230309174650.7093f020.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [PATCH 0/3] Rename queue
 index to queue number

On Thu, Mar 09, 2023 at 05:46:50PM +0100, Halil Pasic wrote:
> To uniquely identify an element we need both the index (a value) and
> the array/table that is being indexed. And I believe this is what we
> need to improve on. I don't think calling indexes into the conceptual
> array of receive queues (or receive virtqueues) "index of the receive
> virtqueue", indexes into the conceptual array of virtqueues that belong
> to a certain device a "vq number", indexes into the descriptor table
> "descriptor keys", and indexes into the used rings "used ring element
> ids" would really help -- to make an attempt at using reduction ad
> absurdum ;)

Right.  I think Parav said he's converting everything to just refer
to "VQ number".


> 
> 
> > I feel there's less of a chance of a confusion between VQ size and
> > its number. But it's not a strong prefrence, RSS is relatively young
> > and it's the only incompatible user of index so far.
> 
> I don't understand why is RSS incompatible with "index".
> 
> Regards,
> Halil

It uses the word "index" in a way that is different from what you
suggest.

Anyway, both "number" and "index" require cleanup work, whoever
is going to do it gets to decide which way it will go.

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

