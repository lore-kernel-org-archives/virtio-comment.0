Return-Path: <virtio-comment-return-4845-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF7DC64EC4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 14:43:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF35941A24
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 14:43:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7244698670B
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 14:43:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61D0B9866FC; Thu,  9 Mar 2023 14:43:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C6489867BF
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 14:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kMjSMh_COMyNJSlMrRb0kA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=215/OfwxHpqQx1+tmu1vRZcW75WKQvRRo3ODbbvGDTc=;
        b=so2C7NGtzFWX8OCQuI4TBk7sBFVfC6PAftCVd9utqqhcMAIPVzrFdntbU2zJq5zX/P
         8vygFocaga8WgJ2nEuiZXWABVr58rcWacSmCm0gIWdQBlKGerWCaBDWUVJ3g8G030EM7
         OwSDFXZyDj05w6nsrHxpmGvNKuT/LJOfbAHuDWDVLSKpPeE6fx50hMRBsRrWsq8ae8Jb
         Hfm3XjGAr0MoRMhdqRzlDJ09AaHicu0JL8gYGfprKdaCyrYXq2v+MTY9/oNt69gsRGDZ
         JKB1W5rQdKHOwMrGu57rPFn/rH/7mWQKqGOUDKDEZI1FGPXZk9XjcEIp2CC8xooKGZq2
         BJOg==
X-Gm-Message-State: AO0yUKVdcw72W0vqubtMgfPe5Uc3SmVRXwmWZGSE/Myqrc+SlJgc5Xtm
	b7LfQ3M/yM886QoNY78lngZ/+gVJJ1GU+02Pd/A/pJjWXeKC91TakPus0gIvCH6TFj/ZGXmDGOy
	sbwakmP3F5mqFHaQ4hL+e1aX1KgtiprrbAA==
X-Received: by 2002:a05:600c:ad3:b0:3ea:e667:b1ee with SMTP id c19-20020a05600c0ad300b003eae667b1eemr19637085wmr.38.1678372998375;
        Thu, 09 Mar 2023 06:43:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+a2bx0aP+ysotCNWv52npiqe8UcL+uyuuGAk8vb50eUM3m+iSypf/qulsC45lvQwboWVp1vA==
X-Received: by 2002:a05:600c:ad3:b0:3ea:e667:b1ee with SMTP id c19-20020a05600c0ad300b003eae667b1eemr19637062wmr.38.1678372998033;
        Thu, 09 Mar 2023 06:43:18 -0800 (PST)
Date: Thu, 9 Mar 2023 09:43:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
	Jiri Pirko <jiri@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230309094240-mutt-send-email-mst@kernel.org>
References: <ZAh61E/wQ/hSY/OI@nanopsycho>
 <18d51bc0-d759-1a05-cb7c-3d46c4ed2f1a@nvidia.com>
 <m2wn3rxgv5.fsf@oracle.com>
 <PH0PR12MB548150700B50006F9F174104DCB49@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ZAmLIc97Ud09YfGT@nanopsycho>
 <PH0PR12MB54817E2CEFF003E793C9B2F3DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
 <m2mt4mxbt5.fsf@oracle.com>
 <PH0PR12MB5481FD2D2365CC08A5CD1E64DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230309091904-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548138694D606CE68B9E0C3ADCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548138694D606CE68B9E0C3ADCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce
 virtio admin virtqueues

On Thu, Mar 09, 2023 at 02:30:52PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, March 9, 2023 9:23 AM
> > 
> > On Thu, Mar 09, 2023 at 02:11:54PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: David Edmondson <david.edmondson@oracle.com>
> > > > Sent: Thursday, March 9, 2023 9:03 AM
> > > >
> > > > Parav Pandit <parav@nvidia.com> writes:
> > > >
> > > > >> From: Jiri Pirko <jiri@nvidia.com>
> > > > >> Sent: Thursday, March 9, 2023 2:31 AM
> > > > >>
> > > > >> Wed, Mar 08, 2023 at 10:25:32PM CET, parav@nvidia.com wrote:
> > > > >> >
> > > > >> >> From: virtio-comment@lists.oasis-open.org
> > > > >> >> <virtio-comment@lists.oasis- open.org> On Behalf Of David
> > > > >> >> Edmondson
> > > > >> >
> > > > >> >> In support of live migration, might we end up moving large
> > > > >> >> amounts of device state through the admin queue?
> > > > >> >>
> > > > >> >Correct.
> > > > >> >
> > > > >> >> If so, that would seem to have some performance requirements,
> > > > >> >> though I don't know if it would justify multiple admin queues.
> > > > >> >DMA of the data through the proposed AQ is supported.
> > > > >> >
> > > > >> >If I understood Max correctly when Max said " This AQ is not
> > > > >> >aimed for performance ", he means that AQ doesn't have
> > > > >> >performance requirements as
> > > > >> io/network queues to complete millions of ops/sec.
> > > > >> >
> > > > >> >it is several hundred to maybe (on the higher side) thousand
> > > > >> >ops/sec during
> > > > >> LM, provisioning use case.
> > > > >>
> > > > >> But isn't it good to design it for performance from start? I
> > > > >> mean, state transfer of thousands of VFs at a time is definitelly
> > > > >> performance
> > > > related, isn't it?
> > > > >>
> > > > > It is. Which part of the proposed AQ doesn't cover this aspect?
> > > > > The only issue that I see today is, that a given GET family of
> > > > > commands q
> > > > contains the read-only and write-only descriptors which require
> > > > multiple dma allocations on driver side.
> > > >
> > > > I don't think that there is any assertion that the current proposal
> > > > doesn't cover this.
> > > >
> > > > It was intended as an illustration to try and help determine whether
> > > > multiple AQs for a single device was a requirement given existing
> > > > anticipated usage, or a safeguard against potential future uses.
> > >
> > > Got it.
> > >
> > > So far my understanding is:
> > > 1. Single AQ is enough for currently cited use cases
> > 
> > FYI transport VQ work started off with multiple vqs.
> > 
> Ok. so there may be some use case for transport VQ.
> Worth to mention in the cover letter and things will be fine.
> Actual review of the transport VQ and its use will be in the respective patchset.
> 
> > > 2. Having the infrastructure to support multiple AQ is also good.
> > > The extra cost of this infra is only one read-only field = aq count as Michael
> > proposed.
> > >
> > > 3. Ability to send multiple outstanding commands and execute them out of
> > order by device is/should be supported as long as IN_ORDER is not negotiated.
> > > Should it be relaxed for AQ that even if IN_ORDER is negotiated, AQ by
> > default can be out of order queue?
> > 
> > I feel there's no need: driver can just avoid negotiating IN_ORDER.
> I didn't understand the "no need" part.
> Do you mean to make use of out-of-order AQ commands, driver should skip IN_ORDER negotiation for the data path queues?
> If yes, it may not be a big loss for the PF.
> 
> I am considering that since AQ is so fresh, it can keep itself detached from the IN_ORDER from the beginning.
> This way AQ and data path queues stay on their own course.

You can make this claim for different types of data queues too.
I'd rather try to solve it for all queues than special-case AQ.

> > Generally I'm not happy with IN_ORDER and have some ideas to replace it with
> > PARTIAL_ORDER, that will also address this.
> > 
> > > 4. Driver is the sole owner to decide if it is modifying an object through AQ, it
> > should synchronize with ongoing AQ command on the same object or not.
> > > 5. If the command gets stuck for a very long time, the driver can recover the
> > AQ using the existing Q RESET facility.
> > >
> > > Do we agree with the above design thoughts?
> > > Or there is a better design than this discussed, and I missed it?
> > >


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

