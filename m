Return-Path: <virtio-comment-return-8651-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E1AC07CB1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:00:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 882E42B021
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:00:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77A829863BE
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:00:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6AF7698639C; Mon, 27 Nov 2023 13:00:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DF219863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 13:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CZRVqSMEPROKjY88kUGvyA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090013; x=1701694813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kapWveYvH1017IvfDENKXEDFhV3O91UZnWaeIst0Dmg=;
        b=dqKVCQg5f9HJ9CqOW46RhXDBctFrOCtdFkC6YrLEUEiKGBTtsv0qpjsX4U+xTOT46k
         /eWteZoY1fk8JD6AXmJI2l6jeTg1x5R5MUCM2IlQ1VRrDKKdUp/Px77BQF+CSTJd+CjB
         FK1gs2iReEwHU921PbpDp4pdz6KMa3r0oFP4qJLEVZK44n9PMVfAJIPh6gguGP0AFCfK
         cg4mQbvuvYTB4CsUPZLbLHlbUKdChXiRtnKQp9UF607VFgsSsK6Vx84d1BjnAPeVE4YJ
         xIiUWR7wV64zrIA8hZfFH3m5/0z8YZhioxs83TvUxBrIgKpp78C6pDORgMUTMmFNnX4A
         gzKg==
X-Gm-Message-State: AOJu0YzbZpZ5edGlzSinpbOmIgHyOi/2hWWnTCradzs+a9ElLTeyS8Ld
	fcODnW3/Twul7vlpSRVpjpj7/C8w5NwXbLFMFT8BeBnTOxcAQyM9aLTGHsWafmFZ6CFNvHDOFhy
	GVJybSusTH7YzeNuccPZLLJkyYdW9e+wQ2g==
X-Received: by 2002:ac2:558c:0:b0:509:4ab3:a8a3 with SMTP id v12-20020ac2558c000000b005094ab3a8a3mr6868656lfg.22.1701090013330;
        Mon, 27 Nov 2023 05:00:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnPnMQ7ggtFiT4WfkyIfviZ/7qYwasyO2zBspEqboCRolcGe2aQmeZf/rC7eB6mwApTfQt5g==
X-Received: by 2002:ac2:558c:0:b0:509:4ab3:a8a3 with SMTP id v12-20020ac2558c000000b005094ab3a8a3mr6868626lfg.22.1701090012933;
        Mon, 27 Nov 2023 05:00:12 -0800 (PST)
Date: Mon, 27 Nov 2023 08:00:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127075440-mutt-send-email-mst@kernel.org>
References: <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127061203-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E1567D7D27A9BF18D9ACDCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127063810-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FD7F68E535A99F51D36ADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127073045-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EDA1A7373B3C4DF71E26DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EDA1A7373B3C4DF71E26DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Mon, Nov 27, 2023 at 12:49:35PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 27, 2023 6:03 PM
> > 
> > On Mon, Nov 27, 2023 at 11:50:24AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, November 27, 2023 5:10 PM
> > > >
> > > > On Mon, Nov 27, 2023 at 11:33:45AM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Monday, November 27, 2023 4:53 PM
> > > > > >
> > > > > > On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > > > > > > > It appears that's not what you meant.
> > > > > > > > > > I can try and guess what you meant but I'd rather have
> > > > > > > > > > you rewrite this in a way that makes the meaning explicit.
> > > > > > > > > >
> > > > > > > > > If you insist, I can duplicate in driver requirements too.
> > > > > > > > > >
> > > > > > > > > > > There are many capabilities here each with a different use.
> > > > > > > > > >
> > > > > > > > > > And you are under the impression that dumping all kind
> > > > > > > > > > of stuff in a single place is good somehow?
> > > > > > > > > It is not dumped.
> > > > > > > > > It is structured based on the functionality.
> > > > > > > > > The config space proposal tends to dump everything in
> > > > > > > > > unstructured way at
> > > > > > > > single place that cannot extended elegantly.
> > > > > > > > >
> > > > > > > > > For example, Xuan's dynamic array cannot be placed next to
> > > > > > > > > other dynamic
> > > > > > > > array of flow filter.
> > > > > > > >
> > > > > > > > I don't know what "dynamic array" is exactly but generally,
> > > > > > > > Any kind of a big array is not appropriate in config space -
> > > > > > > > I don't see any of these
> > > > > > here, though.
> > > > > > > Ah, now I see the disconnect.
> > > > > > >
> > > > > > > There is.
> > > > > > > struct virtio_net_ctrl_ff_match_types
> > > > > >
> > > > > > Now I think I don't understand what this array does at all.
> > > > > > Why are there multiple entries with each entry also including a
> > > > > > mask of multiple fields?
> > > > > >
> > > > > Each entry indicates a bitmask of supported fields that can be filtered.
> > > > > The type indicates how to interpret each fields_map.
> > > > > Any new type for MPLS can be added easily by defining its type and
> > mask.
> > > > > And same type enums and field mask also used by the data path too.
> > > >
> > > > Oh wait I think I begin to remember now. There are 12 bits defined
> > > > so far and you made it this huge array. Right? With code to parse
> > > > and format it all. Just add a 64 bit field and it will last us long
> > > > enough. No parsing and formatting just #define.
> > > The infrastructure defines 12 bits only because this is first minimal viable
> > work.
> > > There will be more fields to be added for more types.
> > 
> > Maybe.  Let's see a list and see if we even get close to 32 bits.
> > 
> There are many ether types to filter based on the device.
> Many types of IPv4 and IPV6 header fields.
> 
> https://www.iana.org/assignments/ieee-802-numbers/ieee-802-numbers.xhtml

If I grep for RFC there I get 31 types. Looks like 64 will last us
for a while.


> > > It is not good to mix up all the fields and bit definitions.
> > 
> > Not good how? 
> I provided example why it will be so bad to mix up the socket options under one socket option command.
> 
> >  It's definitely much simpler than what you wrote.
> Simpler for spec != simpler to implement in device.

Not just spec. Simpler for drivers too. And I suspect that yes a bitmap
is simpler in device too. 100% sure in a software device.

> > Does it matter that bits for a given transport are not all consequitive? I do not
> > see why it matters.
> > 
> It is surely not elegant to spread things around that way. 
> Actually it is not good for TLV definition in the data path flow filter commands.

That TLV thing still needs some thought. Here again,
we can have a single config space array and it's nice and clean
or we need to invent 

> > 
> > > And there are per device max limits which is way more than 12 bits.
> > 
> > These are just a couple of 32 bit fields.
> > 
> And they can be different that cannot be de-duplicated across different member devices.

why would they be different? only if provisioned.  But again, just
access it over DMA then it is not a problem that they are different. The
objection is to using a device specific mechanism as opposed to building
a generic config space over DMA.

> The proposal is not based on the count or RO/RW etc.
> It is based on when it needs to be accessed, as they are not init time early use to initialize the device, they are over cvq.

all these limits are very clearly init time. For example max id can be
used to allocate an array.

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

