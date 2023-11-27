Return-Path: <virtio-comment-return-8649-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0624BC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:52:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 68A821318CF
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:52:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40EB39863D1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:52:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 30BA598639C; Mon, 27 Nov 2023 12:52:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 21A0F9863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 12:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sSWqqwJZPxWewmPkHARUkQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089535; x=1701694335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qd8l5uZrpUikWxQQJDmXHH0y5uM8d3PRl8s/3HNc8/c=;
        b=V05Ce8Alc7Ges1EoYN1QeTAQuDziL7JUyESUWe/v4DNtb8t8JLDNwRbARct4xGL278
         4GhKE3C0eelnF4dJStVizOlhqe7/hi+fPAHhrxrkLA0js3YB7vj05nSOJXoRe9MfgF+Q
         RG0Cl62AnP2HkI9ihYDXSR8DUEge8ZRAAfgFfTr+WIXGB+rlJw1M7OTboOIW9zNqfiZn
         xIZL/XPLQB/2eqC43afBFP/eSIVtPBNk4vFilhoXROr7NgmGwh3fMZ5x3FnNPrDzD2au
         zePu0ogqMYmSCBldHEycu7qI6Y5PyG1a7NOP2oAtbgieEVp6Hp6RvUvQI8e1TKyGPJei
         nrUA==
X-Gm-Message-State: AOJu0YyETcS7nKyOcvyY8odQ5Juhm1hk6MsMpNE166DzRbl6W6HCeB+D
	b2X/bRQq0gMAj24hsEYNMKubna+bPmalTPzV4+QuxFjgcaKszgXqYZDBXcu1NYZrcaQav0xcu/E
	J9ryL4jd10GTSwnlhie5ZFEuaR3Buk1ybow==
X-Received: by 2002:a5d:404d:0:b0:332:e745:f50b with SMTP id w13-20020a5d404d000000b00332e745f50bmr8437041wrp.31.1701089534879;
        Mon, 27 Nov 2023 04:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIZyWVOh83QSaJQEclEuqIk9k3deUr39soU5hhVHRXBhjEYx+66daBiB9UCwkCpUk+bVOHiA==
X-Received: by 2002:a5d:404d:0:b0:332:e745:f50b with SMTP id w13-20020a5d404d000000b00332e745f50bmr8437019wrp.31.1701089534586;
        Mon, 27 Nov 2023 04:52:14 -0800 (PST)
Date: Mon, 27 Nov 2023 07:52:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127074837-mutt-send-email-mst@kernel.org>
References: <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124040545-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127060729-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EBEC8FA0A797D54D1FB1DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EBEC8FA0A797D54D1FB1DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 11:12:47AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 27, 2023 4:40 PM
> > 
> > On Mon, Nov 27, 2023 at 10:19:45AM +0000, Parav Pandit wrote:
> > > >
> > > > > The bright line in based on this usage: bootstap or not.
> > > > > If its runtime, sure have it over CVQ.
> > > > > Following the nice tenet of B.2 of the spec snippet: "Device
> > > > > configuration
> > > > space should only be used for initialization-time parameters"
> > > > > That’s it.
> > > > > And everyone is already aligned to it.
> > > >
> > > > Absolutely. Specifically, when do you expect driver to probe these
> > > > caps? As you yourself explained, it has to do it before ethtool
> > > > calls - that clearly means it will do it in probe.
> > > > To me this simply screams "initialization time".
> > > >
> > > It can be done in driver probe routine after DRIVER_OK, this is fine.
> > 
> > No - it is preferable to do it before DRIVER_OK because VQs are probed and
> > initialized before DRIVER_OK.
> > For example, it is reasonable to decide to only enable MQ if specific flow
> > control can later be enabled.
> 
> For flow filter related caps has no hard dependency to it before driver_ok, same as stats.
> MQ has users even without flow filter.

driver ok is not the end of driver initialization. Things like
pre-populating receive queues are also part of that.

Yes, there is a dependency.  The capability is either not useful at all
(as in the current form - driver makes no decisions here so it
is pointless). Or it will be useful and then it has to be
probed at init time so the data is available at runtime
when decisions are to be made. How *hard* is this dependency?
I don't know. I do know that 100% of drivers will either not
use this command at all or use it at init time.


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

