Return-Path: <virtio-comment-return-8738-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9E3C10F04
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 14:45:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6ADFD2AF98
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 14:45:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D02E9865D1
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Dec 2023 14:45:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3738C986496; Tue,  5 Dec 2023 14:45:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26B70986497
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 Dec 2023 14:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OQTJGOKvMg6toVF9FUWdSA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787524; x=1702392324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04vUDJtRUmKqSY4gP5gtyi64IYl3zTfj5kOwV1eTENE=;
        b=G/urO1hQpXRFw0dZnSF4xaRr+eQYM0YChybjhBMggtbuoBSsuqcyvzvOanABF5cc8H
         7XbIxOgIw8aJcHzmEhfCrSvcXAStcDeHPt6GeuABcPZJUTz+ftTXWKzxogU1iTjSXNSL
         X2BthIZLA1nza9e/IxgMjSUKW/Qlc41UjpxRWQLPCtpdOzTbbcLYBD1Am5Oy67TGVdlh
         U5VuHIQzaoTaJg4vnfRZf36FUkRfk5Xmzqv3VbYmIqDYW4wTrGG812AA3dGegCnPwKoY
         W49Q1VhuFq9PrChCnRWmwGCty3weZplsMAD4kKpSfYgi7XBwUiaEVYQuVn6BOBRGDNkV
         1YCw==
X-Gm-Message-State: AOJu0YzptRyTrPAJVvO58R/8WXBsilb4ATEdxFs4dIbcxIJK7nj6eoan
	d58q4/DyRWMEIh1NZ0HIRv+klbJ5Z7Sb1M2HTkdqFpm+Lx+Bc1Mw/TmoeT7P6DMQLgyxGDjgedl
	7h78AG/WyLcmfXy+AMmTTnN/o6TntG0PsrA==
X-Received: by 2002:a17:906:c7c9:b0:9fe:5d39:41c6 with SMTP id dc9-20020a170906c7c900b009fe5d3941c6mr441836ejb.51.1701787524384;
        Tue, 05 Dec 2023 06:45:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF10i0LiLPnrC+MfqTHukBjpvNoyhYIhWsdabRLPxLLTIpMYD4RnyG3I2nAsHnN6G1cUPY0IQ==
X-Received: by 2002:a17:906:c7c9:b0:9fe:5d39:41c6 with SMTP id dc9-20020a170906c7c900b009fe5d3941c6mr441823ejb.51.1701787523940;
        Tue, 05 Dec 2023 06:45:23 -0800 (PST)
Date: Tue, 5 Dec 2023 09:45:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231205094318-mutt-send-email-mst@kernel.org>
References: <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
 <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com>
 <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <20231204035211-mutt-send-email-mst@kernel.org>
 <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org>
 <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
> 
> 
> 在 2023/12/5 上午11:52, Jason Wang 写道:
> > On Mon, Dec 4, 2023 at 5:34 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > 
> > > 
> > > 在 2023/12/4 下午5:05, Michael S. Tsirkin 写道:
> > > > On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> > > > > On Mon, Dec 4, 2023 at 4:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> > > > > > > On Mon, Dec 4, 2023 at 3:37 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > > > > > > 
> > > > > > > > 在 2023/12/4 下午3:18, Jason Wang 写道:
> > > > > > > > > On Fri, Dec 1, 2023 at 3:16 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > > > > > > > > 在 2023/12/1 下午3:05, Jason Wang 写道:
> > > > > > > > > > > On Fri, Dec 1, 2023 at 2:30 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > > > > > > > > > > 在 2023/12/1 下午2:24, Heng Qi 写道:
> > > > > > > > > > > > > 在 2023/12/1 下午1:18, Jason Wang 写道:
> > > > > > > > > > > > > > On Wed, Nov 29, 2023 at 4:23 PM Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > 在 2023/11/29 下午4:00, Jason Wang 写道:
> > > > > > > > > > > > > > > > On Tue, Nov 28, 2023 at 4:08 PM Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > > To prevent readers from misunderstanding that the driver can
> > > > > > > > > > > > > > > > > only handles packets with partial checksum when
> > > > > > > > > > > > > > > > > VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > >        device-types/net/description.tex | 2 +-
> > > > > > > > > > > > > > > > >        1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > diff --git a/device-types/net/description.tex
> > > > > > > > > > > > > > > > > b/device-types/net/description.tex
> > > > > > > > > > > > > > > > > index aff5e08..529f470 100644
> > > > > > > > > > > > > > > > > --- a/device-types/net/description.tex
> > > > > > > > > > > > > > > > > +++ b/device-types/net/description.tex
> > > > > > > > > > > > > > > > > @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types
> > > > > > > > > > > > > > > > > / Network Device / Feature bits
> > > > > > > > > > > > > > > > >        \begin{description}
> > > > > > > > > > > > > > > > >        \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with
> > > > > > > > > > > > > > > > > partial checksum offload.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> > > > > > > > > > > > > > > > > partial checksum.
> > > > > > > > > > > > > > > > > +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with
> > > > > > > > > > > > > > > > > partial checksum or full checksum.
> > > > > > > > > > > > > > > > So patch 2 said
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > "
> > > > > > > > > > > > > > > > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles packets with
> > > > > > > > > > > > > > > > full checksum.
> > > > > > > > > > > > > > > >        \end{description}
> > > > > > > > > > > > > > > > "
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Is there any difference between the two "full checksum" here?
> > > > > > > > > > > > > > > There's no difference.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that the driver
> > > > > > > > > > > > > > > "can
> > > > > > > > > > > > > > > only" handle packets with full checksum.
> > > > > > > > > > > > > > This seems to be odd.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Driver can always handle packet with full checksum, no?
> > > > > > > > > > > > > Yes.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > I meant it
> > > > > > > > > > > > > > will be then to be functional equivalent to !
> > > > > > > > > > > > > > VIRTIO_NET_F_GUEST_FULL_CSUM?
> > > > > > > > > > > > > Are you referring to
> > > > > > > > > > > > > "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> > > > > > > > > > > > Sorry, this is a typo. I meant
> > > > > > > > > > > > 
> > > > > > > > > > > > Are you referring to
> > > > > > > > > > > > "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> > > > > > > > > > > > 
> > > > > > > > > > > > > If so, I think it's no.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Maybe a description similar to the following would be more clearer:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not handle
> > > > > > > > > > > > > packets with partial checksum.
> > > > > > > > > > > I may miss something here, but what's the difference between
> > > > > > > > > > > 
> > > > > > > > > > > VIRTIO_NET_F_GUEST_FULL_CSUM
> > > > > > > > > > > 
> > > > > > > > > > > and
> > > > > > > > > > > 
> > > > > > > > > > > !VIRTIO_NET_F_GUEST_CSUM?
> > > > > > > > > >     From the device perspective:
> > > > > > > > > > 
> > > > > > > > > > If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with full
> > > > > > > > > > checksum to the driver,
> > > > > > > > > > but the device can not validate the checksum for these packets. That is,
> > > > > > > > > > the flags in virtio-net-hdr
> > > > > > > > > > will not contain _DATA_VALID, and the driver or stack needs to validate
> > > > > > > > > > these packets.
> > > > > > > > > > 
> > > > > > > > > > If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets with full
> > > > > > > > > > checksum to the driver,
> > > > > > > > > > and the device can validate the checksum for these packets. That is, the
> > > > > > > > > > flags in virtio-net-hdr
> > > > > > > > > > will contain _DATA_VALID,
> > > > > > > > > I think DATA_VALID is optional here as device can't recognize all type
> > > > > > > > > of protocols.
> > > > > > > > Yes, you are right, so I used "device *can*" here. Which packet types
> > > > > > > > the device recognizes or validates
> > > > > > > > depends on the device's implementation. This is also the current
> > > > > > > > practice of GUEST_CSUM.
> > > > > > > > 
> > > > > > > > > > and the driver or stack does not need to
> > > > > > > > > > validate these packets.
> > > > > > > > > Ok, so I think there're something that is subtle here,
> > > > > > > > Ok, I see.
> > > > > > > > 
> > > > > > > > > and that's why
> > > > > > > > > I'm asking here:
> > > > > > > > > 
> > > > > > > > > 1) "Driver does not handle packets with partial checksum" is not
> > > > > > > > > accurate, !GUEST_CUSM also fit for this definition.
> > > > > > > > > 2) "Driver handles packets with full checksum" is kind of ambiguous as
> > > > > > > > > it doesn't say whether or not the packet has been validated or not.
> > > > > > > > Maybe the description below would be less subtle?
> > > > > > > > +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial
> > > > > > > > checksum or full checksum.
> > > > > > > I'd suggest to leave it as is. As I didn't find any issue since even
> > > > > > > with DATA_VALID. Did you?
> > > > > > > 
> > > > > > > > +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles packets
> > > > > > > > with full checksum,
> > > > > > > > and the device optionally validates the packet's checksum.
> > > > > > > Or maybe something like (not a native speaker)
> > > > > > > 
> > > > > > > The driver handles packets with full checksum which the device has
> > > > > > > already validated.
> > > > > > > 
> > > > > > > Thanks
> > > > > > I feel we just need a proper definition of what does "full checksum"
> > > > > > mean in this context. It is used but not defined.
> > > > > > Assume this feature was negotiated.
> > > > > > My understanding is that this is just like VIRTIO_NET_F_GUEST_CSUM
> > > > > > but certain values in the header are then disallowed? Which?
> > > > > > This should be in the spec.
> > > > > Yes, I think it is probably the headers that DATA_VALID can work. We
> > > > > never define it in the past.
> > > > > 
> > > > > E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY, but it can
> > > > > only work for some specific protocols:
> > > > > 
> > > > > """
> > > > >    *   %CHECKSUM_UNNECESSARY is applicable to following protocols:
> > > > >    *
> > > > >    *     - TCP: IPv6 and IPv4.
> > > > >    *     - UDP: IPv4 and IPv6. A device may apply CHECKSUM_UNNECESSARY to a
> > > > >    *       zero UDP checksum for either IPv4 or IPv6, the networking stack
> > > > >    *       may perform further validation in this case.
> > > > >    *     - GRE: only if the checksum is present in the header.
> > > > >    *     - SCTP: indicates the CRC in SCTP header has been validated.
> > > > >    *     - FCOE: indicates the CRC in FC frame has been validated.
> > > > > """
> > > > > 
> > > > > I'm not sure whether it's just fine to duplicate the definition or
> > > > > it's too late to define any now.
> > > > I think it's mostly harmless for other protocols.
> > > I'm not sure if this should be defined by a new FULL_CSUM feature.
> > > This seems to be an issue with GUEST_CSUM.
> > > 
> > > I think we should supplement these with a new patch for GUEST_CSUM?
> > Probably. My understanding is:
> > 
> > You want to reuse DATA_VALID here, so we need to stick to a consistent
> > semantic for GUEST_CUSM and FULL_CSUM. So we need a definition of
> > "full csum" or what kind of packet could DATA_VALID work here.
> 
> I agree, we can be clear about what types of packets DATA_VALID might
> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
> 
> But I think we also need something like \field{supported_validate_types} to
> indicate which packet types the device supports validating and setting
> DATA_VALID,
> otherwise the device driver that negotiates this feature may fail to live
> migration.
> Am I right?
> 
> I'm not sure how GUEST_CSUM works now as it should also suffer from the
> above
> mentioned issues with live migration, but no devices are reporting this
> right now.
> 
> Maybe, each device only supports checksum verification for TCP/UDP by
> default? I don't know.
> But I hope we can focus on this and get consensus, because our hw release
> date is coming soon.
> 
> Thanks a lot!


First, DATA_VALID is not a thing that hardware should ever use.
It's a hack when packets are passed within host.
Second I don't understand what it has to do with this
discussion.
Your patch should be more specific and define which
header fields are compatible with the new offload option.



> > 
> > Thanks
> > 
> > > Thanks!
> > > 
> > > > > > After this is written up we will come up with a good short
> > > > > > description for the feature bit.
> > > > > > 
> > > > > Thanks
> > > > > 
> > > > > > > > Thanks!
> > > > > > > > 
> > > > > > > > > Thanks
> > > > > > > > > 
> > > > > > > > > > Thanks!
> > > > > > > > > > 
> > > > > > > > > > > Thanks
> > > > > > > > > > > 
> > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
> > > > > > > > > > > > > > > > >                reconfiguration support.
> > > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > > 2.19.1.6.gb485710b
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > > > > > > before posting.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > > > > > > List Guidelines:
> > > > > > > > > > > > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > > 
> > > > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > > > before posting.
> > > > > > > > > > 
> > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > > 
> > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > 
> > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > before posting.
> > > > > > > > 
> > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > 


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

