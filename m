Return-Path: <virtio-comment-return-6188-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D104C7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:06:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACB8C1318CC
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:06:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A230998658C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:06:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9967898657E; Tue,  6 Jun 2023 23:06:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 892E1986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 23:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rtON0b1qMEGXU8akL24Z8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092771; x=1688684771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJtX6Egy9s86EYAcU3SGVW68CB4DQ+TyvLUv6M/kfGw=;
        b=U4VgCclggkDdeMVNtiXNSMWAXe+0H/2R5nn5nNpJZaxHVkNu+42Uwj/ggJHTGkMtc4
         xGlYf2z6p5hBKATyips+8mB0liwRIjeEmC/7X93PIz1Gcp2q6efQH3fAMVov3HsQ6O6c
         fELDf+pqTDLSZc69c9JCa6PSbEnpPV+aaDnzO8g5cNrdH9ShwRtgW7zJzw8EaqX2v8cB
         oqOtrteuwT+mjFbbeP9kjTzPYTBptleU/QxsXmzrmZcH5oYZv5OavPzi6898rxy56TLp
         Z+GxqOBz2QyITntJ5FTtNQYyuh+XQsWYQRMkabSx6MeKCRrK7BCp5kCdRRhtcq0G21OZ
         9usw==
X-Gm-Message-State: AC+VfDwCrHGHu15ExedEZQb3FYPYJS1KANazZoKXaKYAWSx9RUAHP+5N
	HWR+HW6p7lxkUd/XKjypTckP9qBSfEsY4ONlkP0O5JualVX02nSQPSaW/9xqKZLBHiIUuKsrx18
	JzMO3ZcoQOFNPMWTN6T9TiI3gd/mRcaBKftHVyfgcdQ==
X-Received: by 2002:a5d:52c8:0:b0:30c:84d3:f5a with SMTP id r8-20020a5d52c8000000b0030c84d30f5amr9792949wrv.4.1686092771019;
        Tue, 06 Jun 2023 16:06:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZXwZSQeeb3QgHw0f6TwFln5OJVSQjxIRVQfpxYZwN+8KaI7IGLTd6QRvySYrX3Ud0nOl0LQ==
X-Received: by 2002:a5d:52c8:0:b0:30c:84d3:f5a with SMTP id r8-20020a5d52c8000000b0030c84d30f5amr9792943wrv.4.1686092770741;
        Tue, 06 Jun 2023 16:06:10 -0700 (PDT)
Date: Tue, 6 Jun 2023 19:06:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606190338-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-5-parav@nvidia.com>
 <20230606183336-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C5A0E642F63B8624DBCBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C5A0E642F63B8624DBCBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 4/7] net-features: Add
 notification coalescing requirements

On Tue, Jun 06, 2023 at 10:46:53PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 6:37 PM
> 
> > >  # 3. Requirements
> > >  ## 3.1 Device counters
> > > @@ -143,3 +144,10 @@ struct vnet_rx_completion {  7. The device should
> > > be able to indicate when a full page buffer is consumed,
> > >     which can be recycled by the driver when the packets from the completed
> > >     page is fully consumed.
> > > +
> > > +## 3.3 Virtqueue notification coalescing re-enable support 1. Tx and
> > > +Rx virtqueue notification coalescing should auto-disable on
> > > +   notification reporting to the driver. The driver should be able to enable
> > > +   coalescing after processing the packets per VQ. This ensures that when
> > > +   networking stack decides to poll, no new notifications are generated when
> > > +   per VQ notification coalescing is used.
> > 
> > I don't know what does auto-disable and enable coalescing mean.
> > Does this refer to VIRTIO_NET_F_NOTF_COAL?
> 
> > what is the problem this is trying to solve?
> >
> Current driver when uses F_VQ_NOTF_COAL, and polling, it still receives the event (interrupt) from the device, because the time is always running.
> (event is not auto disabled on generation of the event).
> So number of interrupts are not fully controlled yet by the driver.

could we please speak virtio terms? you are not new in this area..
so this is asking for a way to disable used buffer notifications?
we actually have this with packet vq always and with split
without EVENT_IDX. what is missing?

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

