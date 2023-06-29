Return-Path: <virtio-comment-return-6603-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEED4EB64DC
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 11:46:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4D18142905
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 11:46:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C6B09866F7
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 11:46:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2CE4E9865F0; Thu, 29 Jun 2023 11:46:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A5B79865CA
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 11:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NkJb3J_2PnmZGwsw1MPkbg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688039174; x=1690631174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKeHZqMK7cug6gV5jU2oNadoKAeeU377VtWCZLVIFCs=;
        b=eHDafP4hSCTFw6cQHbLcvmytLThIE4gXO2XSVRqcX1qPOSryu69zts9p7yywxuIgyM
         N2XiVqPllaxhqn9PgxaQPD/ccTweSD5I/vYSxt1wcNDFeZ8Kzkc29P5RgItqYS3OCGG6
         uGE82LVYzmFg9cqf4Ttr+F5KiyXtFMPJTarP3zn9g3VR8HkUHRVioiBKo13ThJ4tBmAf
         D3OwnbJ/DKvg6bevbxB+wxuEdijtXR99/yjSPC9uOJT4DVy00lnGHrfrBCHo7rvF8C/z
         MjXLglGfH1bIsmTxPMvvDuMHE9DjqHVToTA7yvL7s+mRzoOr3aV4+gmTRy+r4C3cguCT
         +jxQ==
X-Gm-Message-State: AC+VfDwFq6VLGN+a5+Qxn3Ip3NqTYviMFS5o8z49ZVAz7W/UPxCQnHrv
	1zeF+VWC/nkq2z89TDRKMv03+Wd4+APehlKF7GvuPAjnEzKYiWjVbM9z/sJ2wsX27G3h5mzV6vR
	mPGdiodl+ww/ikoPeI/UUrIutIsJ1R6+YGw==
X-Received: by 2002:adf:f48e:0:b0:314:ca7:6332 with SMTP id l14-20020adff48e000000b003140ca76332mr4704537wro.63.1688039174112;
        Thu, 29 Jun 2023 04:46:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ltTD08HQvKgwBVY6mtxaBaXPlsxXz+SiMxPONRI5GGUqjQtFXRDZHYXKfshi2UrBr6JZPxA==
X-Received: by 2002:adf:f48e:0:b0:314:ca7:6332 with SMTP id l14-20020adff48e000000b003140ca76332mr4704527wro.63.1688039173736;
        Thu, 29 Jun 2023 04:46:13 -0700 (PDT)
Date: Thu, 29 Jun 2023 07:46:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230629074358-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628061257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481ED6C94DE8CC414C3369BDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628123131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628132122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814D42786A6981467D3FADDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628152125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EAD97F6163C52DF4FF53DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230629064042.GB77232@h68b04307.sqa.eu95>
MIME-Version: 1.0
In-Reply-To: <20230629064042.GB77232@h68b04307.sqa.eu95>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v19] virtio-net: support inner
 header hash

On Thu, Jun 29, 2023 at 02:40:42PM +0800, Heng Qi wrote:
> On Thu, Jun 29, 2023 at 01:56:34AM +0000, Parav Pandit wrote:
> > 
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, June 28, 2023 3:45 PM
> > > > > Maybe I get it. You want to use the new features as a carrot to
> > > > > force drivers to implement DMA? You suspect they will ignore the
> > > > > spec requirement just because things seem to work?
> > > > >
> > > > Right because it is not a must normative.
> > > 
> > > Well SHOULD also does not mean "ok to just ignore".
> > > 
> > > 	This word, or the adjective "RECOMMENDED", mean that there
> > > 	   may exist valid reasons in particular circumstances to ignore a
> > > 	   particular item, but the full implications must be understood and
> > > 	   carefully weighed before choosing a different course.
> > >
> > RECOMMENDED and SHOULD forces the device to support MMIO, which is not good.
> > So rather a good design is device tells the starting offset for the extended config space.
> > And extended config space MUST be accessed using a DMA.
> > With this sw can have infinite size MMIO and hw device forces DMA based on its implementation of where to start DMA from.
> > This also gives the ability to maintain current config as MMIO for backward compatibility.
> >  
> > > 
> > > 
> > > > > There's some logic here, for sure. you just might be right.
> > > > >
> > > > > However, surely we can discuss this small tweak in 1.4 timeframe?
> > > >
> > > > Sure, if we prefer the DMA approach I don't have a problem in adding
> > > temporary one field to config space.
> > > >
> > > > I propose to add a line to the spec " Device Configuration Space"
> > > > section, something like,
> > > >
> > > > Note: Any new device configuration space fields additional MUST consider
> > > accessing such fields via a DMA interface.
> > > >
> > > > And this will guide the new patches of what to do instead of last moment
> > > rush.
> > > 
> > > Yea, except again I'd probably make it a SHOULD: e.g. I can see how switching to
> > > MMIO might be an option for qemu helping us debug DMA issues.
> > >
> > There are too many queues whose debugging is needed and MMIO likely not the way to debug.
> >  
> > > The time to discuss this detail would be around when proposal for the DMA
> > > access to config space is on list though: I feel this SHOULD vs MUST is a small
> > > enough detail.
> > >
> > From implementation POV it is certainly critical and good step forward to optimize virtio interface.
> >  
> > > Going back to inner hash. If we move supported_tunnels back to config space,
> > > do you feel we still need GET or just drop it? I note we do not have GET for
> > > either hash or rss config.
> > >
> > For hash and rss config, debugging is missing. :)
> > Yes, we can drop the GET after switching supported_tunnels to struct virtio_net_hash_config.
> >  
> 
> I would like to make sure if we're aligned. The new version should contain the following:
> 1. The supported_tunnel_types are placed in the device config space;
> 2. Reserve the following structure:
> 
>      struct virtnet_hash_tunnel {
> 		le32 enabled_tunnel_types;
>      };
> 
> 3. Reserve the SET command for enabled_tunnel_types and remove the GET command for enabled_tunnel_types.
> 
> If there is no problem, I will modify it accordingly.
> 
> Thanks!
> > > And if we no longer have GET is there still a reason for a separate command as
> > > opposed to a field in virtio_net_hash_config?
> > > I know this was done in v11 but there it was misaligned.
> > > We went with a command because we needed it for supported_tunnels but
> > > now that is no longer the case and there are reserved words in
> > > virtio_net_hash_config ...
> > > 
> > > Let me know how you feel it about that, not critical for me.
> > 
> > struct virtio_net_hash_config reserved is fine.


Just a second, when I talked about virtio_net_hash_config I meant this:


struct virtio_net_hash_config {
    le32 hash_types;
-   le16 reserved[4];
+   le32 enabled_tunnel_types;
+   le16 reserved[2];
    u8 hash_key_length;
    u8 hash_key_data[hash_key_length];
};

and then we do not add a new command we modify the hash config command.

Parav still ok with you?

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

