Return-Path: <virtio-comment-return-8540-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC74C61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:15:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C6F382AEE2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:15:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A70AC9868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:15:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8CA9D9843C0; Wed, 22 Nov 2023 07:15:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B2F5986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 07:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: asiJdCCKME2t5rMi9MRYzg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700637326; x=1701242126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLsoUsHi1WUwIQPPSxQgFZ2CazNavKC1nOUjZ9zgXvA=;
        b=DbcDT8RWZ6RGA2/OZwjzVwt1GudYJysVImm3UsxA2uuBGVMKCYD4X9ZqCqNEwkX1be
         F4pcc0oRQJhoRy52hOSHVot4hFpZuJaUaMTQfGQ8Lduc4XjxNaLpUp5lt3mrXnozhBHI
         omZ8elhX7b0wk8veYw2fswxajxZm94wLKsup2hOEf/H9mx+6liKkqaUzLe8ADy6S5hj5
         T0pPbHs8MIDxfGt8kJfvZus9k9+zls46257ypgdOu6LDxurVFoDM7XkqV76RCs6YbXos
         EMhivdIGNRDyVFsKsZGDbmA2C9/wL728IIml1Qfl5n9W43KsjvLGkHXOU6PuENFCbDu/
         AUbQ==
X-Gm-Message-State: AOJu0Yy5IGBko/gvd0Ur+5ZbBYEQJrDBZf94JWBPD13k57fIand9+pTd
	ZCcwxuuOzJyP0Lf8zLdpLOCCdhvK9u9HTN7ZFdgxaEGT4f/nMlNp08nK2KHT/ZMOzP7e8XXQSOy
	+DCM6IQYbjY+tFNrfobu6HdbRPxNy6xo4Ug==
X-Received: by 2002:a05:6402:323:b0:548:5fa2:dcc4 with SMTP id q3-20020a056402032300b005485fa2dcc4mr1147023edw.6.1700637326219;
        Tue, 21 Nov 2023 23:15:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZMYGZIvftgf+oBzYzeCwblzlumhSYt7vE/2c5y9GFYl5gffMVx4W2KNvZl5MArvyBwKUWg==
X-Received: by 2002:a05:6402:323:b0:548:5fa2:dcc4 with SMTP id q3-20020a056402032300b005485fa2dcc4mr1147013edw.6.1700637325951;
        Tue, 21 Nov 2023 23:15:25 -0800 (PST)
Date: Wed, 22 Nov 2023 02:15:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231122015435-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548189E49C97E91374B3F514DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com>
 <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
 <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com>
 <PH0PR12MB5481501A7771A21583B905B1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvNoLny_VPaQ5Ooob3cEystgdc6xi24G5wScT5FUdVz_Q@mail.gmail.com>
 <PH0PR12MB54815513853CC3299D2DBC7EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtBbDS91gKf1pGiWNBLXatS0PjPJDEU4JtC6=uAjrOBzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtBbDS91gKf1pGiWNBLXatS0PjPJDEU4JtC6=uAjrOBzA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Wed, Nov 22, 2023 at 12:15:44PM +0800, Jason Wang wrote:
> On Wed, Nov 22, 2023 at 12:26 AM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Tuesday, November 21, 2023 10:01 AM
> > >
> > > On Fri, Nov 17, 2023 at 6:06 PM Parav Pandit <parav@nvidia.com> wrote:
> > > >
> > > >
> 
> [...]
> 
> > > > Sorry, no virtio specification does not support device migration today.
> > > > Nothing is broken by adding new features.
> > > >
> > > > Above [1] has the right proposal that Jason's paper pointed out. Please use
> > > it.
> > >
> > > I was involved in the design in [1]. And I don't see a connection to the
> > > dicussion here
> > >
> > > 1) It is based on vDPA in L0
> > > 2) It doesn't address the nesting issue, it requires a proper design in the virtio
> > > spec to support migration in the nesting layer.
> >
> > Nothing prevents [1] to be done without vdpa.
> 
> Well, Qemu has SR-IOV emulation for IGB. What's the point of the above
> reply? If a hypervisor wishes, it can be done with any device on L0.
> 
> We discuss the possibility of migrating nested VMs, not the
> possibility of emulating SR-IOV, no?
> 
> Thanks

It depends really. If the way to support nesting is to emulate sr-iov
then the question becomes how hard it is to emulate sriov to the point
where nesting works.

The fact that current hypervisors pretend that a VF is a PF when
passing things on to guest and things still seem to work is
nice but it's not a hugely important design point IMHO.

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

