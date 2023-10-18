Return-Path: <virtio-comment-return-7814-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F2CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A09BE42D64
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97C6598689E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 842CC986899; Wed, 18 Oct 2023 11:12:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 745E098689A
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 11:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MCPNQhQXPMqL8oKN7qxT6A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697627541; x=1698232341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEy0xik3+CvnQ4lJWmwummmR5F3We8yQONt/5ACD2+U=;
        b=B2qN5oRELFwi8TGgHibQq/cvm3efyhM1K21OBCqPv19yhBiDbMD1IueWDc+saQlRug
         tqOOK4LRbMyTrjY1KYkJuf+YSXCDMBIo6EEeil00mo77j0bkjC3I18Y0veeqilQVfjtN
         AQKvUjeu8I6Z3CN3xPBxiJyS4H+dTmZ3l+fx8jsPgEMCMDTxWN1ncnRmp9Skj2EgINcJ
         fjs7OJ01FNWYFrSsjMHgZX8ou1NBv2Z12dGf4KnzkPc6lP+QP7YNOhedQnq/xe0zkdh1
         nHxQKRWNn8kfqnYyjNmco0N7FCCWdKVNXqUaDsneX+WOlaVe+AozC2UViMr9GGxjyleg
         IL6A==
X-Gm-Message-State: AOJu0YwEYkO2JCsq2WKM7adAgpOntX/z3E/c+HOcMsVTp0aHVpU3N/MV
	AZQnA29F51kFExIcRZC6DUIrKCLBBynBkq6ddm9iD9I2tc1ExOktvdi90zp4o8Z6IGbDJ7UnGOa
	e/v739nAR69OqWtQc485tdxaBQsCL0uaWLQ==
X-Received: by 2002:a05:6402:42c7:b0:53d:fe06:3bb2 with SMTP id i7-20020a05640242c700b0053dfe063bb2mr4154688edc.8.1697627541454;
        Wed, 18 Oct 2023 04:12:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPOsiDi9IewJCvnHdVOqPQWrc6OK+GhR7jhqqz2ijm6sU7XlkloWxdfrBgEVDF97HRFiWbkw==
X-Received: by 2002:a05:6402:42c7:b0:53d:fe06:3bb2 with SMTP id i7-20020a05640242c700b0053dfe063bb2mr4154673edc.8.1697627541074;
        Wed, 18 Oct 2023 04:12:21 -0700 (PDT)
Date: Wed, 18 Oct 2023 07:12:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231018071144-mutt-send-email-mst@kernel.org>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com>
 <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com>
 <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87pm1cchuq.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Wed, Oct 18, 2023 at 01:03:57PM +0200, Cornelia Huck wrote:
> On Wed, Oct 18 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
> >> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
> >> 
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> Sent: Tuesday, October 17, 2023 5:55 PM
> >> >> 
> >> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
> >> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST enable
> >> >> > +the required number of virtqueues before setting the DRIVER_OK status bit.
> >> >> 
> >> >> What does "required" mean here? It just chooses to enable the queues it wants
> >> >> to use, right?
> >> > Right.
> >> > Required meaning, whatever number of queues that driver choose to enable, those must be enabled before driver_ok.
> >> > So it is "required by the driver".
> >> > Would that be ok?
> >> 
> >> I'd write it as "the driver MUST enable any virtqueue it plans to use"
> >> or something like that.
> >> 
> >> (...)
> >
> > It would have to be SHOULD - we can't add new MUST requirements not
> > contingent on a feature bit, we can give recommendation based on
> > existing installed base.
> 
> Then I wonder whether we need to add any normative statement at all --
> prior to the introduction of this new feature, the driver had to enable
> anything it wanted to use before DRIVER_OK, and if it does not negotiate
> the new feature, nothing changes. Spelling that out in non-normative
> sections should be enough?

I think it's not a bad thing to be clearer, but I don't care much.

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

