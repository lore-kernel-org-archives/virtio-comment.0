Return-Path: <virtio-comment-return-5947-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F114C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:58:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5D9A8157EED
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:58:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F6739862FA
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:58:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C1E49862F6; Tue, 16 May 2023 20:58:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1951B9862F7
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 20:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UF02KIzQON6KKNvWYdgnoA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684270698; x=1686862698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUACpzouZxgkElJbC0jJcq7DGVYJO3vgMBGarmyoQMc=;
        b=O/oxYwZvDDThh3Ndh/BKTYCiwnKJWHcuETxQNmYmIzBg6SodiIawjalKq1Z1vNz7h6
         1u8r3KAT0SfFhd0id1Q0JPto7Ntt/qf7BwZr9mFExCF0VRBb0vr/uPVuEo8kOlVhZJon
         FZbkZQjlvhwmtAmMIhw3i9t7mEA4opB6Tb2oc9n4l0SYe760+KCpuME8VpdWxgGyJ7s6
         Bx74jEbBUO9izXsBmR+tpOgMMaiLgD+AKUfTGvHUlWqgr/trRVl4Ews0uEbsc9Z0fSai
         1o9RIL6gcT+Cu3RUb6HPiYz6iYdpcWs2zqGrLqLQJaqDxZkWlX7BX161oPvvCMGnYwde
         Mi5A==
X-Gm-Message-State: AC+VfDxjZ8xs2dOZYS7n4ms8ll9t7WejLS1i+eFWbv2nEabgOVXL2MHx
	9OnOzLgraR6BPFnNDQtKqUnFBodqzXjJSJpWBfRJD/RYZJdQKDh/OUCivxEMMBrlk6YHmKT32W8
	EYv0TCcupW1C+m13+Ni+d22be4sqNaPeVgw==
X-Received: by 2002:a7b:ca43:0:b0:3f1:72dc:8bae with SMTP id m3-20020a7bca43000000b003f172dc8baemr25116467wml.21.1684270698748;
        Tue, 16 May 2023 13:58:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ59PA7j2ro5i3xjtFHdvn3ljRakjrbhDVsXwoz20uuM++WSYK0/J1PgrG5/3OceNIZBoBFuOw==
X-Received: by 2002:a7b:ca43:0:b0:3f1:72dc:8bae with SMTP id m3-20020a7bca43000000b003f172dc8baemr25116457wml.21.1684270698392;
        Tue, 16 May 2023 13:58:18 -0700 (PDT)
Date: Tue, 16 May 2023 16:58:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230516165509-mutt-send-email-mst@kernel.org>
References: <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
 <PH0PR12MB548136C3582B9DE232AEFDE5DC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230516021401-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816BF1E277820C594A6344DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816BF1E277820C594A6344DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Tue, May 16, 2023 at 07:11:36PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, May 16, 2023 2:22 AM
> > 
> > On Mon, May 15, 2023 at 03:59:41PM +0000, Parav Pandit wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, May 15, 2023 3:31 AM
> > >
> > > > > What do we gain from bisecting it?
> > > >
> > > >
> > > > 1) No need to deal with the offset in the hardware
> > > >
> > > In context of legacy is doesn’t matter much given that its over AQ.
> > 
> > Let me give you an example. I feel that device specific config should allow
> > arbitrary length accesses so that e.g.
> > mac can be read and written atomically.
> > 
> > On the other hand, this is not the case for common config.
> > 
> Why is this not the case with common config?
> Spec snippet: "When using the legacy interface the driver MAY access the device-specific configuration region using any
> width accesses"

I mean, what you said above exactly?
device-specific configuration excludes common config.


> > I feel we do not need to allow e.g. access to both common config and device
> > specific one in a single operation, that is just messy. 
> It is just an offset and value.
> What part bothers you?

E.g. that it can cross the coundary between common and device config.


> > Now sure, we can add text
> > with an explanation, but if instead there's a flag saying "this is common cfg"
> > or "this is device cfg" then it fall out automatically.
> > 
> > Is this a deal breaker? No, but note how neither I nor Jason did not think about
> > this ahead of the time and the correct usage just falls out of the interface
> > automatically.  This is a mark of a good interface design. Lots of corner cases
> > that one has to be careful around is not.
> It just moves corner case one layer above in multiple software hypervisors and hypervisor is not failing it either on cfg read/writes as expected by the guest.
> So bisecting is not adding anything extra. Those failure checks are going to be ignored in hypervisor anyway.

Look we didn't build modern because we wanted to make work, we did
because legacy is broken.  So either let legacy die already or let's
build a sane interface to emulate it please.

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

