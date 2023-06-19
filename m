Return-Path: <virtio-comment-return-6400-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95853EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:37:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E5B56190909
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0127986428
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:37:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BD1199863A6; Mon, 19 Jun 2023 17:37:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8B969863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 17:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uMyBGVhVMhKA34JohOi08A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687196263; x=1689788263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3050zEV9/MzgWmosdTeWPjPE4G3lxcfo4ol+uBaZmBY=;
        b=cZKRQjCd41GBUqYhC6QD3R7oLpu2AWwUgTzP0VVXPk30lMWU97/kCWmADJv7MQvcC+
         BZXmnz5HrczewauPvEN+Zs2tZvOeUjdvDBvRg27RhLBIGzFFlCHuaSgJeQ2Fh9Olb7xv
         +4fvKDe7BSbno/eo8BHUi28cR4T/YkoSt2gcNj+5NVi1BbHctWdpKhAZ23fuE5eS6YgV
         +xJWWFl+IRQ5hfxlhEhRo2VgCyWhUMqO+Z5ezNxnVoUueO8/+Vnz87O4Oxll3OGKdv1z
         5zW7KOVAYARPhHcPsnaeeYEJLtzsLNtHHQCPhK1HrL6yuUFYTsdpUmJRCEWMBYcXi7eU
         CH3Q==
X-Gm-Message-State: AC+VfDzv3pFOHzsfz2ERsJFpK/dwnx5mqKsllSy7gUuLfP9vzKq7GiBM
	ACA+xKoRjh8nDgqwCDlvmvxbDMFNsuAhc7WQl8LV8Mx+QhqRFoH4oIpqzHfYr+FFB7LODD5HOWa
	UGD/QhfyyWdYkJr+jSQfNLG+JbEFv6OLatA==
X-Received: by 2002:a05:6000:181:b0:311:149c:23fa with SMTP id p1-20020a056000018100b00311149c23famr9050433wrx.25.1687196263636;
        Mon, 19 Jun 2023 10:37:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZDMKvsO1LRlC+KiNquOpszjksSayH1Ky69uDAMpLUMxum8ovlXMJwJ7xTAJSEMBw18PC+lg==
X-Received: by 2002:a05:6000:181:b0:311:149c:23fa with SMTP id p1-20020a056000018100b00311149c23famr9050415wrx.25.1687196263326;
        Mon, 19 Jun 2023 10:37:43 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:37:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230619133322-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-5-parav@nvidia.com>
 <20230619122836-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481758B8EE080750D6377C0DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619131115-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1836A5B9A7B345A20A8DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D1836A5B9A7B345A20A8DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 4/4] transport-pci: Introduce group legacy group
 member config region access

On Mon, Jun 19, 2023 at 05:26:22PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, June 19, 2023 1:20 PM
> 
> > > It is reused, but it doesnt come for free.
> > > Do you want to re-consider AQ notify query command?
> > > Or continue as proposed in v6?
> > 
> > 
> > If we can't just make it come for free then maybe
> > VIRTIO_PCI_CAP_LEGACY_NOTIFY_CFG is better, we can just list the number in
> > the common section and then link to the description in the new section.
> >
> How is it better? It requires burning more bytes.
> Is it better because it is self contained?

Mostly yes. But it also adds a bit more flexibility, right?
I thought avoiding touching transport-pci is worth less
flexibility but if we can't avoid that...


> > I also feel we want ability to have such a capability in the owner too.
> > Would prefer including it now though I guess we can add it as an extension.
> 
> Re-opening the past discussion.. amazing. :)

OK fair enough.. I guess both of us are not 100% happy but
it's a compromize for now. And maybe we'll add one of AQ
and / or PF cap down the road.

> Why? How is it different and better than querying over AQ?

Wait a second let me clarify. I am talking about notification
in the PCI BAR of the PF. *Not* offset in PF capability
but in the VF BAR.


> I see the AQ is better than group owner and group member specific cap.



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

