Return-Path: <virtio-comment-return-8722-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DAC10DC1
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:53:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 98D4F2A8E4
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:53:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7FE6F9863F0
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 08:53:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A77498408C; Mon,  4 Dec 2023 08:53:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C422986376
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 08:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: s4eWOu6JO5CKHNY9-XOPXA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701680032; x=1702284832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77DDMkD2cf1+mV5VrORmTlE4UNDzkosHB/Rw+ShPWhc=;
        b=Rpdbn15gDXplXskmgSBaZBsAjfarUgk5gnqRKRTBUjvFYOMkosuNtwqgvSQTdcYzaa
         QYyOqZ+22z4Zv+queuZ2V9D2fErSXNHv9vRujiSzRLIsylqLeVWhcqYNxqwikhutJSdp
         fNc0S9jD5XYosohORz6Irni5u3X1gH3YfzoYAQGHLtYT/rB9I2r39YrbNZOAJ+MeUBQr
         lIDarE7jnCIqAiMD/p1g6H6ZVTcyudtCuOGz1037ve46CKzUYdGR2ZxW7G9UPkpUPTzt
         OpWLYzkbMpxNAny1bpARJiKxhDHXB39ln0wdRD5ih3CmV7PlMbz5wh3FdSVPKPB2Fqow
         5CzQ==
X-Gm-Message-State: AOJu0YxFxmIT0cH5AW1eBIOGB4tCvW/QnmLw08EQG1JBv8ngASAx33ob
	hC7pwOvxedyaaSgtum/0O4EtqV8G/+RMZuiYCOYXkKh5tfIrNQibM58CGLus018DgaexKY1JpN8
	cfu8sSVo5L2ybkJeE05nNdZSz5RrQ3zSMNg==
X-Received: by 2002:a05:600c:8608:b0:40b:5f03:b40e with SMTP id ha8-20020a05600c860800b0040b5f03b40emr1229200wmb.304.1701680032697;
        Mon, 04 Dec 2023 00:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9SWVlrUTzNTb55ziAfeaXPwvVN/xqP9STqq0WOPyNRL8MdbQFj11+ciEYJWafb6gJpuWN5g==
X-Received: by 2002:a05:600c:8608:b0:40b:5f03:b40e with SMTP id ha8-20020a05600c860800b0040b5f03b40emr1229195wmb.304.1701680032326;
        Mon, 04 Dec 2023 00:53:52 -0800 (PST)
Date: Mon, 4 Dec 2023 03:53:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231204035211-mutt-send-email-mst@kernel.org>
References: <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com>
 <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com>
 <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
 <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
 <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com>
 <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> On Mon, Dec 4, 2023 at 3:37 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> >
> >
> >
> > 在 2023/12/4 下午3:18, Jason Wang 写道:
> > > On Fri, Dec 1, 2023 at 3:16 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >>
> > >>
> > >> 在 2023/12/1 下午3:05, Jason Wang 写道:
> > >>> On Fri, Dec 1, 2023 at 2:30 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >>>>
> > >>>> 在 2023/12/1 下午2:24, Heng Qi 写道:
> > >>>>> 在 2023/12/1 下午1:18, Jason Wang 写道:
> > >>>>>> On Wed, Nov 29, 2023 at 4:23 PM Heng Qi <hengqi@linux.alibaba.com>
> > >>>>>> wrote:
> > >>>>>>> 在 2023/11/29 下午4:00, Jason Wang 写道:
> > >>>>>>>> On Tue, Nov 28, 2023 at 4:08 PM Heng Qi <hengqi@linux.alibaba.com>
> > >>>>>>>> wrote:
> > >>>>>>>>> To prevent readers from misunderstanding that the driver can
> > >>>>>>>>> only handles packets with partial checksum when
> > >>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
> > >>>>>>>>>
> > >>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > >>>>>>>>> ---
> > >>>>>>>>>      device-types/net/description.tex | 2 +-
> > >>>>>>>>>      1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/device-types/net/description.tex
> > >>>>>>>>> b/device-types/net/description.tex
> > >>>>>>>>> index aff5e08..529f470 100644
> > >>>>>>>>> --- a/device-types/net/description.tex
> > >>>>>>>>> +++ b/device-types/net/description.tex
> > >>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types
> > >>>>>>>>> / Network Device / Feature bits
> > >>>>>>>>>      \begin{description}
> > >>>>>>>>>      \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with
> > >>>>>>>>> partial checksum offload.
> > >>>>>>>>>
> > >>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> > >>>>>>>>> partial checksum.
> > >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> > >>>>>>>>> partial checksum or full checksum.
> > >>>>>>>> So patch 2 said
> > >>>>>>>>
> > >>>>>>>> "
> > >>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with
> > >>>>>>>> full checksum.
> > >>>>>>>>      \end{description}
> > >>>>>>>> "
> > >>>>>>>>
> > >>>>>>>> Is there any difference between the two "full checksum" here?
> > >>>>>>> There's no difference.
> > >>>>>>>
> > >>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver
> > >>>>>>> "can
> > >>>>>>> only" handle packets with full checksum.
> > >>>>>> This seems to be odd.
> > >>>>>>
> > >>>>>> Driver can always handle packet with full checksum, no?
> > >>>>> Yes.
> > >>>>>
> > >>>>>> I meant it
> > >>>>>> will be then to be functional equivalent to !
> > >>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> > >>>>> Are you referring to
> > >>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> > >>>> Sorry, this is a typo. I meant
> > >>>>
> > >>>> Are you referring to
> > >>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> > >>>>
> > >>>>> If so, I think it's no.
> > >>>>>
> > >>>>> Maybe a description similar to the following would be more clearer:
> > >>>>>
> > >>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> > >>>>> packets with partial checksum.
> > >>> I may miss something here, but what's the difference between
> > >>>
> > >>> VIRTIO_NET_F_GUEST_FULL_CSUM
> > >>>
> > >>> and
> > >>>
> > >>> !VIRTIO_NET_F_GUEST_CSUM?
> > >>   From the device perspective:
> > >>
> > >> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with full
> > >> checksum to the driver,
> > >> but the device can not validate the checksum for these packets. That is,
> > >> the flags in virtio-net-hdr
> > >> will not contain _DATA_VALID, and the driver or stack needs to validate
> > >> these packets.
> > >>
> > >> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets with full
> > >> checksum to the driver,
> > >> and the device can validate the checksum for these packets. That is, the
> > >> flags in virtio-net-hdr
> > >> will contain _DATA_VALID,
> > > I think DATA_VALID is optional here as device can't recognize all type
> > > of protocols.
> >
> > Yes, you are right, so I used "device *can*" here. Which packet types
> > the device recognizes or validates
> > depends on the device's implementation. This is also the current
> > practice of GUEST_CSUM.
> >
> > >
> > >> and the driver or stack does not need to
> > >> validate these packets.
> > > Ok, so I think there're something that is subtle here,
> >
> > Ok, I see.
> >
> > > and that's why
> > > I'm asking here:
> > >
> > > 1) "Driver does not handle packets with partial checksum" is not
> > > accurate, !GUEST_CUSM also fit for this definition.
> > > 2) "Driver handles packets with full checksum" is kind of ambiguous as
> > > it doesn't say whether or not the packet has been validated or not.
> >
> > Maybe the description below would be less subtle?
> > +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial
> > checksum or full checksum.
> 
> I'd suggest to leave it as is. As I didn't find any issue since even
> with DATA_VALID. Did you?
> 
> > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles packets
> > with full checksum,
> > and the device optionally validates the packet's checksum.
> 
> Or maybe something like (not a native speaker)
> 
> The driver handles packets with full checksum which the device has
> already validated.
> 
> Thanks

I feel we just need a proper definition of what does "full checksum"
mean in this context. It is used but not defined.
Assume this feature was negotiated.
My understanding is that this is just like VIRTIO_NET_F_GUEST_CSUM
but certain values in the header are then disallowed? Which?
This should be in the spec.

After this is written up we will come up with a good short
description for the feature bit.


> 
> >
> > Thanks!
> >
> > >
> > > Thanks
> > >
> > >> Thanks!
> > >>
> > >>> Thanks
> > >>>
> > >>>>> Thanks!
> > >>>>>
> > >>>>>> Thanks
> > >>>>>>
> > >>>>>>> Thanks!
> > >>>>>>>
> > >>>>>>>> Thanks
> > >>>>>>>>
> > >>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
> > >>>>>>>>>              reconfiguration support.
> > >>>>>>>>> --
> > >>>>>>>>> 2.19.1.6.gb485710b
> > >>>>>>>>>
> > >>>>> This publicly archived list offers a means to provide input to the
> > >>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > >>>>>
> > >>>>> In order to verify user consent to the Feedback License terms and
> > >>>>> to minimize spam in the list archive, subscription is required
> > >>>>> before posting.
> > >>>>>
> > >>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > >>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > >>>>> List help: virtio-comment-help@lists.oasis-open.org
> > >>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > >>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > >>>>> List Guidelines:
> > >>>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
> > >>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > >>>>> Join OASIS: https://www.oasis-open.org/join/
> > >>
> > >> This publicly archived list offers a means to provide input to the
> > >> OASIS Virtual I/O Device (VIRTIO) TC.
> > >>
> > >> In order to verify user consent to the Feedback License terms and
> > >> to minimize spam in the list archive, subscription is required
> > >> before posting.
> > >>
> > >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > >> List help: virtio-comment-help@lists.oasis-open.org
> > >> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > >> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > >> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > >> Committee: https://www.oasis-open.org/committees/virtio/
> > >> Join OASIS: https://www.oasis-open.org/join/
> > >>
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >


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

