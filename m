Return-Path: <virtio-comment-return-7022-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921A5C001DF
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 10:33:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D15D2120D57
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 10:33:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5AD49866ED
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 10:33:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9303F9866DE; Fri,  4 Aug 2023 10:33:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7969E9866E2
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Aug 2023 10:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bQu-FNqgNyeFv-2I2pdBhA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691145205; x=1691750005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jt0Bni4kidfjGJ3E7mDNNcg+EgaVQeiqUUoIVUDZc8=;
        b=F78XufE8Q8WG0K7UL1c+ScweEst0kcBhgi4evG/aFZWJe1h7wB8Z8PHDwdZe/Oq7nf
         LjAMMBwgSFXUXW/+9kRnSDco0dzej/0up0FkW6p1Zy+7TUVvbWECyfGboYgUfqgNmamd
         lZvOGBtAXD49uDod61ZzCckeMet8QJ3Pb8mVk/6EDD1270Htn7gG12BEb26Kr4437HFB
         +wwbqi+vnJV3vBio5142t9/qE5mbtvRGLIAx7Ag0Hgt7Ee/Tsufqy7UzS60Vz4BNl72J
         dNH3eXZeaMY+gO3Rk8xZtTj45+lm94RpISBXpxNsH1Cxqndu0txHD3tCujS5MFe3+37C
         5HKQ==
X-Gm-Message-State: AOJu0YwCMh0NmyaVGKJfDd0PueY4SlA1UD35IKWlQE/fTz/gC+g2NWUA
	+XJGVflXX9Gh5K8hOikRCl869U8CARlNHPUssk2e6cc5xoCaYswjxHUppkEHibydTztM4uYd+Wh
	DJd25P/T7KHF+fvRDsV1iceYI00Xo2shbMg==
X-Received: by 2002:a05:6402:11ca:b0:522:b9ae:db3c with SMTP id j10-20020a05640211ca00b00522b9aedb3cmr1752920edw.6.1691145205127;
        Fri, 04 Aug 2023 03:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtm85LDTnKNKq4UJ+bvRc84cDaOHg6AhdSZHYeI2gQqvnJ0BcP5RcpQ86uBefZcTuO00IrEw==
X-Received: by 2002:a05:6402:11ca:b0:522:b9ae:db3c with SMTP id j10-20020a05640211ca00b00522b9aedb3cmr1752905edw.6.1691145204833;
        Fri, 04 Aug 2023 03:33:24 -0700 (PDT)
Date: Fri, 4 Aug 2023 06:33:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230804053958-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481CB7BE555F4672394A6ECDC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062204.2378864-7-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481E104793F9E68E1DC95CADC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062877.0013635-8-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481C3CE21016385BF7D6FF0DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691129914.3255427-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481F521F146049E5E483B7DDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691132049.7182267-2-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481BE16AC810CD3A6D64832DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691135097.4908528-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1691135097.4908528-3-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: RE: RE: RE: [virtio-comment] RE: RE: RE: RE: [RFC] virtio-net:
 support access and control the member devices

On Fri, Aug 04, 2023 at 03:44:57PM +0800, Xuan Zhuo wrote:
> On Fri, 4 Aug 2023 07:26:01 +0000, Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Sent: Friday, August 4, 2023 12:24 PM
> >
> > > I know the gap. For us, the switch is under all devices(including the owner
> > > device).
> > > So we need to control the switch separately.
> > >
> > Right. Same for other devices too, including ours.
> > Hence, it is also located outside of the owner device (on a different system).
> >
> > If the switch is not a virtio device, does it really need to be exposed as virtio object?
> >
> > > In your structure, the owner device works as the switch. It has port to connect
> > > to the vf devices.
> > >
> > Right. I just put owner device as switch for simplicity of the discussion.
> >
> > At this point to have port for owner device requires creating a dedicated switching object, to be located sometimes side by side inside the owner, sometimes outside.
> > All of these cases to be crafted, please rethink if this is _really_ needed as virtio object or not.
> 
> 
> YES.
> 
> We can hear others.
> 
> @Jason @Michael
> 
> 
> Thanks


This is so abstract, hard to have any position as I'm not sure what
we are discussing. If some virtio devices have an integrated switch
then ability to control the switch through virtio seems useful.

Re:queues - it's not by chance that we have multiple admin queues.
So driver can dedicate one queue to filtering commands if
that's felt to be important.


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

