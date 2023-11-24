Return-Path: <virtio-comment-return-8610-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D607C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:13:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A23C93357A
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:13:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FDDE9868AF
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:13:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 507809862D9; Fri, 24 Nov 2023 09:13:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3EE4E9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 09:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4xFAxuOxM1uoNrZ_7AhugA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700817209; x=1701422009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDbLNlekHacB1+WrGTW5FLChyA/vY9r9Nf92noepdOg=;
        b=qaC5efhLhR++Gus8aBmHbqZoyPseJR2YJYVO5YZUfaoksZgs/YoaPO8Y7Eynz/O7Bm
         pJEIDbzusEItxUcuiudok/PxIAbwo7iItp8mc0GaXyoN+M3o/3CHxigg1za5/vJdewjr
         oIDiNPS8iT/mRyzvICrIVY3kkKXaeJOdjOy0MdGt7yd5Gk+8dFf9H6m2mHCX52IYXjjr
         iCVR926DC2Sh+qDCbxR7tquAhHMPAegNKY7S8rcPv8XqcMN67yQ9A7uI44LpIi/BVVhG
         TGfGBNScOpdW0V/ssSVCokN7A4N5VGkm+1/C8USZAJwbvqfHxaiUGecTju9Ha4RfTq8E
         3WAA==
X-Gm-Message-State: AOJu0Ywx5u8c7vgISPJOOC3ENlO21RNONc+d/lNGeLWuX3ZYjhDZE6Re
	sjNpEVGMcpXVEYvzdGvZrearXaABVDX+rxF+/5aqr8Lap2o2VlRQyRAumIh86leYF+dbrmbLfLT
	3amEJk2kQa7kDXgEKhmbA3N5fhga+VX+Paw==
X-Received: by 2002:a17:906:3598:b0:9fa:8ef2:3a28 with SMTP id o24-20020a170906359800b009fa8ef23a28mr1363737ejb.38.1700817209675;
        Fri, 24 Nov 2023 01:13:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOsFhliTuzV2+5KmFAowzDifrwlRF7X2Z4x4HvCON3GaKb03tYY9Qub2TwkJcJ9ourWmdSUQ==
X-Received: by 2002:a17:906:3598:b0:9fa:8ef2:3a28 with SMTP id o24-20020a170906359800b009fa8ef23a28mr1363719ejb.38.1700817209309;
        Fri, 24 Nov 2023 01:13:29 -0800 (PST)
Date: Fri, 24 Nov 2023 04:13:25 -0500
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
Message-ID: <20231124040545-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 06:41:11AM +0000, Parav Pandit wrote:
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, November 24, 2023 11:32 AM
> 
> 
> > Just to clarify my point, what's I'm saying is
> > 
> > 1) For CVQ, it is used to send the commands to the device. It's not good to use
> > transport to send those commands
> This is not what is proposed.
> 
> CVQ is proposed to exchange capabilities and configuration between driver and device.
> (not to transport to send commands)
> 
> > 2) The configuration space is the place to advertise the capabilities, e.g what
> > kind of commands could the device accept.
> > 
> and it is not efficient and not used anymore with 1.3 and higher.
> They are exchanged using single get/set interface where device does not need to do special cross synchronization between what is exposed via interface_1 (config space) and control via interface_2 (cvq).

Why because you wrote that google doc? There never was any concensus on this.

> > 2) doesn't conflict with 1)
> > 
> CVQ does not conflict with anything as it stands today in 1.3.
> 
> > And we are discussing the provisioning which is more about 2) but not 1)
> > here.
> Provisioning will set the device and device will run based on what is being set.
> If MSIX is provisioned, it will show up in MSIX attribute.
> If the BAR region size is provisioned it will show in PCI MMIO size.
> If 1.3 legacy mac address configured, shows up in virtio_net_config.
> if 1.3 rss configuration, shows up in virtio net config
> 
> if 1.3 stats configuration, shows up in stats.
> If 1.4 flow filters provisioned shows in flow filter caps.
> 
> The primary tenet is: config space contains only the necessary driver bootstap fields.

I don't want to argue what bootstrap is. Please use existing spec
terminology. initialization time is a better definition we already use
in spec - it is clearly whatever info driver needs during probe and
whatever subsystem specific initialization callback is.  For example,
for network - ndo_open.


> The bright line in based on this usage: bootstap or not.
> If its runtime, sure have it over CVQ.
> Following the nice tenet of B.2 of the spec snippet: "Device configuration space should only be used for initialization-time parameters"
> That’s it.
> And everyone is already aligned to it.

Absolutely. Specifically, when do you expect driver to probe these
caps? As you yourself explained, it has to do it before ethtool
calls - that clearly means it will do it in probe.
To me this simply screams "initialization time".


> > 
> > That's it.
> > 
> > Thanks
> > 
> > 
> > >
> > > > Worst case devices can lie, it is not clear worrying about
> > > > statistics when provisioning is important enough.
> > > Device statistics cannot be broken when migrating.
> > >
> > > > And
> > > > you are now under the impression everyone got convinced when in
> > > > reality everyone just got tired of arguing. This is not a good pattern to try
> > and repeat.
> > > > Let me repeat the relevant part here for
> > > > you:
> > > >
> > > >       So why shouldn’t we just add some transport VQ on the owner
> > > > device to transport the SIOV device’s configuration?
> > > >
> > > >               Ans:
> > > >               Such addition means that hardware vendors need to
> > > > build runtime configurations in 4 different ways.
> > > >               One way using CVQ for PCI PF and VFs
> > > >               2nd way as backward compatible SIOV using owner’s
> > > > admin VQ
> > > >               3rd way using SIOV’s own CVQ channel for TDISP
> > > >               4th way using mix of backward compatible and secure
> > > > and efficient way using #2 and #3.
> > > >
> > > >
> > > > This is just a straw-man argument. No - we make a capability
> > > > optional,
> > > Capabilities are not optional.
> > > The design has undergone carefully review to ensure that driver honors the
> > capability, and it is migratable both.
> > >
> > > You dint explain why capability should be optional.
> > > The first patch has defined how the capabilities are used by the driver.
> > >
> > > > we
> > > > strongly suggest that *drivers* support both old and new mechanism,
> > > > and then *devices* will only implement what's required.
> > > There are other examples in the same document that makes things worst
> > with old and new.
> > >
> > > Also there is literally no way to enforce that driver supports both and new. It
> > is just sounds like an excuse to force infinite config space.
> > >
> > > The method proposed here is elegant and clearly promote one way to do
> > things for driver and device with predictability.
> > >
> > >
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

