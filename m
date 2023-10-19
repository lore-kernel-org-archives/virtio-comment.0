Return-Path: <virtio-comment-return-7842-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AA0CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:55:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E5DA7192869
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:55:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA28B9868D2
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:55:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B763D9868CC; Thu, 19 Oct 2023 08:55:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A83BF9868CD
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 08:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KZ7qnOV0NTq4l_Rjc3OqcQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697705737; x=1698310537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI2bkFYTJP9M0omy2xHH9Gzmc2tmZS79svG28sMBFJ8=;
        b=MAyHCCrCiPUE20KsuyuISmVzm1P4gHw/mBslrGqlr/OHIOFnboLSiMVxWv3gaN5OPE
         8t/z6IQiRbdGCra6w3QTWqM6G+oESZD6YuFt3UU/QFitLciH9kIaQHZYV1je39iq8ry9
         ziFK1O3nPaD8uFQgSAzKl+7nVxoduG27Mo62TcVVfuqgfLRFeGOb2WpEPv2dvN4g8qh3
         HZyJhKinQkbEm3Hi/UbO8MURW/hzqu0wJS3aIyPQJBUaVYYO6u9k7oOto78V2ElxTobB
         OHsqk4q3lNBQyFL7TEQiDZICAEJzXfuvx8GWsMUzbAOmpfS8Lg/o/l3f5OziswBQJOzs
         Vkmw==
X-Gm-Message-State: AOJu0YzZhxiEkUv90YlmYFOT64gJ3ptD24OhgBvB+FjGgUAbqYDgLH94
	UsiJXghlaWXHADoPwwnrqdHvo3G4JpAI5rOifSfyeqSuier3MXxOujkk6+dFN+0tAKRdKLZmIa/
	IhOKgUJjyugLesrEDhaj6DbVXWzq4/3nf0Q==
X-Received: by 2002:a05:600c:5254:b0:405:409e:1fcb with SMTP id fc20-20020a05600c525400b00405409e1fcbmr1246722wmb.5.1697705737553;
        Thu, 19 Oct 2023 01:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccGCVXB0MJn+wZXR6fyk9V+/1F6DkYf2g99LNL+HmHtlhtd+B8eIdYi0CLTcnRfEa/7J9cw==
X-Received: by 2002:a05:600c:5254:b0:405:409e:1fcb with SMTP id fc20-20020a05600c525400b00405409e1fcbmr1246705wmb.5.1697705737229;
        Thu, 19 Oct 2023 01:55:37 -0700 (PDT)
Date: Thu, 19 Oct 2023 04:55:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019045203-mutt-send-email-mst@kernel.org>
References: <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018062951-mutt-send-email-mst@kernel.org>
 <4e812bc4-a90f-4726-948a-d8d04e568be2@intel.com>
 <20231019043150-mutt-send-email-mst@kernel.org>
 <76ae3405-a388-4d9f-b02f-82bd56a661db@intel.com>
MIME-Version: 1.0
In-Reply-To: <76ae3405-a388-4d9f-b02f-82bd56a661db@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 19, 2023 at 04:49:21PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 10/19/2023 4:37 PM, Michael S. Tsirkin wrote:
> > On Thu, Oct 19, 2023 at 04:18:42PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 10/18/2023 6:47 PM, Michael S. Tsirkin wrote:
> > > > On Wed, Oct 18, 2023 at 10:22:57AM +0000, Parav Pandit wrote:
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Wednesday, October 18, 2023 3:26 PM
> > > > > > For completeness, and to shorten the thread, can you please list known
> > > > > > issues/use cases that are addressed by the status bit interface and how you plan
> > > > > > for them to be addressed?
> > > > > I will avoid listing known issues for a moment for status bit in this email.
> > > > > 
> > > > > Status bit interface helps in following good ways.
> > > > > 1. suspend/resume the device fully by the guest by negotiating the new feature.
> > > > > This can be useful in the guest-controlled PM flows of suspend/resume.
> > > > > I still think for this, only feature bit is necessary, and device_status modification is not needed.
> > > > > D0->D3 and D3->D0 transition of the pci can suspend and resume the device which can preserve the last device_status value before entering D3.
> > > > > (Like preserving all rest of the fields of common and other device config).
> > > > > This is orthogonal and needed regardless of device migration.
> > > > > 
> > > > > 2. If one does not want to passthrough a member device, but build a mediation-based device on top of existing virtio device,
> > > > > It can be useful with mediating software.
> > > > > Here the mediating software has ample duplicated knowledge of what the member device already has.
> > > > > This can fulfil the nested requirement differently provided a platform support it.
> > > > > (PASID limitation will be practical blocker here).
> > > > > 
> > > > > How to I plan to address above two?
> > > > > a. #1 to be addressed by having the _F_PM bit, when the bit is negotiated PCI PM drives the state.
> > > > > This will work orthogonal to VMM side migration and will co-exist with VMM based device migration.
> > > > OK that sounds kind of reasonable. Lingshan, Jason are you interested in
> > > > suspend/resume? Want to start a thread on best way to support that?
> > > suspend/resume a device through PM? why? is the status bit in my series
> > > better?
> > I don't know. If we can please stop discussing suspend in live migration
> > thread and have one with focus on suspend then maybe that's exactly what
> > is needed.  Is there even a problem we need to solve? Do we need to stop
> > vqs or is reset as done currently good enough?
> I have been asked the question above, so I raise my concern, nothing more.
> > Let's focus on that and then hopefully these flamewars can finally stop?
> OK

OK as in there will be a thread for addressing VM suspend or OK as in
it's not really of interest?

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

