Return-Path: <virtio-comment-return-8646-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA2C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:33:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 85D684454A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:33:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66CE59863A5
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:33:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4EAED986397; Mon, 27 Nov 2023 12:33:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F82798639C
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 12:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vtZm1lX3NQa3al93YThZWA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701088411; x=1701693211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Vsrdi8YF37RRJ8JAIq4oaHy/OAEz9EhMQf+4/s5Vp8=;
        b=NlFW318Vl8yEyLnQGbA5F4rloqs/OeqPX79EFftX9oWW6Zo5SmLMWG02SROtukLwzH
         jLGFXHwzXscPiwu2W6/6qg31BCQF0vwMN28Dcgqdn5KARugSWXYBQFUo7YTkKD2aKocH
         4Q8juVqmL/6oknVGEPocfIQYoN7fvGoHY4gnKvNObMNtVD/lzAwOpfyuPzx9iGTW+w9C
         qV5ya4I2Us0l3ybEUX7/KERZYMMAg623FIuiEHMReSUaIBCTjfuUJZr2SeyVZKLHgbo0
         xR6+82JvFlYRfuczUkaMgK2L2jM8yzHY61IMO6EX8nSSMcHz7EQVo1Jdu/8RFfdAHMS2
         Qw+A==
X-Gm-Message-State: AOJu0YwkYmgwy9w5f30JmRvVc9eN0kzp9GCc92drvr04BfMkkn9riFY1
	7KBaRIYRx01jEdOwaRL7sMvPkZN5wV9b1CmFfwfz5gxnAZEeDvje8jxac0rZFytxoSs47bT19bg
	o0NXgkmkBESYz3jbnmvHeLBKJ02RpNlgJEQ==
X-Received: by 2002:a17:906:7382:b0:a10:f6c8:b144 with SMTP id f2-20020a170906738200b00a10f6c8b144mr1064538ejl.73.1701088410797;
        Mon, 27 Nov 2023 04:33:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYLgEnWOaA7SOQAQGD0Kl2EmHvS5U+qL2IG4v6XiemY7ogMIfyt/fRalE5T7hBmEtTTQlFxg==
X-Received: by 2002:a17:906:7382:b0:a10:f6c8:b144 with SMTP id f2-20020a170906738200b00a10f6c8b144mr1064526ejl.73.1701088410498;
        Mon, 27 Nov 2023 04:33:30 -0800 (PST)
Date: Mon, 27 Nov 2023 07:33:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127073045-mutt-send-email-mst@kernel.org>
References: <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127061203-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E1567D7D27A9BF18D9ACDCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127063810-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FD7F68E535A99F51D36ADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FD7F68E535A99F51D36ADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Mon, Nov 27, 2023 at 11:50:24AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 27, 2023 5:10 PM
> > 
> > On Mon, Nov 27, 2023 at 11:33:45AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, November 27, 2023 4:53 PM
> > > >
> > > > On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > > > > > It appears that's not what you meant.
> > > > > > > > I can try and guess what you meant but I'd rather have you
> > > > > > > > rewrite this in a way that makes the meaning explicit.
> > > > > > > >
> > > > > > > If you insist, I can duplicate in driver requirements too.
> > > > > > > >
> > > > > > > > > There are many capabilities here each with a different use.
> > > > > > > >
> > > > > > > > And you are under the impression that dumping all kind of
> > > > > > > > stuff in a single place is good somehow?
> > > > > > > It is not dumped.
> > > > > > > It is structured based on the functionality.
> > > > > > > The config space proposal tends to dump everything in
> > > > > > > unstructured way at
> > > > > > single place that cannot extended elegantly.
> > > > > > >
> > > > > > > For example, Xuan's dynamic array cannot be placed next to
> > > > > > > other dynamic
> > > > > > array of flow filter.
> > > > > >
> > > > > > I don't know what "dynamic array" is exactly but generally, Any
> > > > > > kind of a big array is not appropriate in config space - I don't
> > > > > > see any of these
> > > > here, though.
> > > > > Ah, now I see the disconnect.
> > > > >
> > > > > There is.
> > > > > struct virtio_net_ctrl_ff_match_types
> > > >
> > > > Now I think I don't understand what this array does at all.
> > > > Why are there multiple entries with each entry also including a mask
> > > > of multiple fields?
> > > >
> > > Each entry indicates a bitmask of supported fields that can be filtered.
> > > The type indicates how to interpret each fields_map.
> > > Any new type for MPLS can be added easily by defining its type and mask.
> > > And same type enums and field mask also used by the data path too.
> > 
> > Oh wait I think I begin to remember now. There are 12 bits defined so far and
> > you made it this huge array. Right? With code to parse and format it all. Just
> > add a 64 bit field and it will last us long enough. No parsing and formatting just
> > #define.
> The infrastructure defines 12 bits only because this is first minimal viable work.
> There will be more fields to be added for more types.

Maybe.  Let's see a list and see if we even get close to 32 bits.

> It is not good to mix up all the fields and bit definitions.

Not good how?  It's definitely much simpler than what you wrote.
Does it matter that bits for a given transport are not all
consequitive? I do not see why it matters.


> And there are per device max limits which is way more than 12 bits.

These are just a couple of 32 bit fields.

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

