Return-Path: <virtio-comment-return-8081-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA790C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:37:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2103B2B149
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:37:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F35F9986BB1
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:37:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D75BC986BAF; Wed,  1 Nov 2023 06:37:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB137986BB0
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 06:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7COiygqpN2eTB9Lbmj13kw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698820644; x=1699425444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw95wYyR//GfHbqHCeyccCwCpBmbSVstCgbA/nYgMn8=;
        b=S0gF8Hbsl7g3QwT9KB1M2ZVA9A4jgMGVy4PbQNXDN1ezAbK+r3BDPBHvx0JRiaR1yM
         E7+30EEPwD0+HxNSe/zFmfPNxcDqQ5szADKeLRxqcuWPpER98P4ps14FZpmBB7TvXdWu
         aRqdEuqXPuU/CECFVnQnNfFl/CTMB2QZIkqO8FN5JUst8sIpwcyoKd7mdLd9kUWHHQ/k
         5yG8CgHgB2BxNBQFEyFhrprV3hWVcs7ouXCH2KvPLBNP/0b8szF4fWWJelrqYE12qE8o
         oz5moW/syoX5mYxoA2x4jXs0z6foSSjDKC+xDaZNCrO++teJbv3q2B/E1GsX2CCtaRRN
         mkMw==
X-Gm-Message-State: AOJu0YyJATvsXJkG09JTChBAMjCPxHwVySTrW9xyHXbdD5gdJI0h2l0a
	d+pyx3FKWhQBbe1dWC3MIDeGaFNL3JSVIjccv+dYh/OmT8Y8+2AlcW9nVH2yY6XkGF1Hrr02PRX
	en2lQQr8IvT2Pt/fnw3vsWfCxawMXQqIlqw==
X-Received: by 2002:a5d:5a06:0:b0:32d:a101:689d with SMTP id bq6-20020a5d5a06000000b0032da101689dmr18436953wrb.56.1698820643794;
        Tue, 31 Oct 2023 23:37:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIDZC5B+JvR7N5s/JuJ40qdL8jcO/n4VQWXxwLFL7Riz++QKitxrg65ii9AlyWBvLcvoESRQ==
X-Received: by 2002:a5d:5a06:0:b0:32d:a101:689d with SMTP id bq6-20020a5d5a06000000b0032da101689dmr18436933wrb.56.1698820643445;
        Tue, 31 Oct 2023 23:37:23 -0700 (PDT)
Date: Wed, 1 Nov 2023 02:37:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101023257-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 05:42:56AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, November 1, 2023 11:01 AM
> > 
> > On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Tuesday, October 31, 2023 3:44 PM
> > > >
> > > > On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > > > > Your answer is not relevant to this discussion at all.
> > > > > > Why?
> > > > > > Because we were discussing the schemes where registers are not used.
> > > > > > One example of that was IMS. It does not matter MSI or MSIX.
> > > > > > As explained in Intel's commit message, the key to focus for IMS
> > > > > > is "queue
> > > > memory" not some hw register like MSI or MSI-X.
> > > > > you know the device always need to know a address and the data to
> > > > > send a MSI, right?
> > > >
> > > > So if virtio is to use IMS then we'll need to add interfaces to
> > > > program IMS, I think. As part of that patch - it's reasonable to
> > > > assume - we will also need to add a way to retrieve IMS so it can be
> > migrated.
> > > >
> > > > However, what this example demonstrates is that the approach taken
> > > > by this proposal to migrate control path structures - namely, by
> > > > defining a structure used just for migration - means that we will
> > > > need to come up with a migration interface each time.
> > > > And that is unfortunate.
> > > >
> > > When the device supports a new feature it has supported new functionality.
> > > Hence the live migration side also got updated.
> > > However, the live migration driver does not have to understand what is inside
> > the control path structures.
> > > It is just byte stream.
> > > Only if the hypervisor live migration drive involved in emulating, it will parse
> > and that is fine as like other control structures.
> > 
> > The point is that any new field needs to be added in two places now and that is
> > not great at all.
> > 
> Most control structs are well defined. So only its type field is added to migrating driver side.
> This is very low overhead field and handled in generic way for all device types and for all common types.

Weird, not what I see.  E.g. you seem to have a structure duplicating queue
fields. Each new field will have to be added there in addition to the
transport.

> > We need a stronger compatiblity story here I think.
> > 
> > One way to show how it's designed to work would be to split the patches. For
> > example, add queue notify data and queue reset separately.
> I didn't follow the suggestion. Can you explain splitting patches and its relation to the structure?
> 
> > 
> > Another is to add MSIX table migration option for when MSIX table is passed
> > through to guest.
> Yes, this will be added in future when there is actual hypervisor for it.

You are tying the architecture to an extremely implementation specific
detail.

Hypervisors *already* have migrate the MSIX table. Just in a hypervisor
specific way. queue vector is an index into this table. So the index
is migrated through the device but the table itself has to be
trapped and emulated by hypervisor? Give me a break.

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

