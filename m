Return-Path: <virtio-comment-return-8744-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C7C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:36:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4544E2AC6A
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:36:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 284709867BC
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 04:36:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0C693983FE1; Wed,  6 Dec 2023 04:36:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0083986688
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 04:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9EZN9kfRNP6ZjEOD8UuRng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701837365; x=1702442165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIrSp/ukTnob2xy4Hpi9ugxxOwhZVVeO4a+GOwGQzUE=;
        b=GtsBU23SS2fkrhJlQVM95RHcYXxMJbrUZPHDaT24A1bR/97T6aPWiiLctChZvCCpzV
         wODvnIEUzOE4v0zr4usu9CbRblxkV45Y6HC2lu9ht6BDkqaVFTsiqXDdLo+H4uftr71t
         rD4gAmB7gUR9VnXQ46L77d+Uyt1lXQAqtlPHgZOyCLFMjLSoCe6fWaHAHchtSBrT/zD3
         wW9y+qPG+3ob5KGB2VXs6aezFevzFjTwrDovqgTERlFSder5Cu2qa/10XuAcDCwJS0Rz
         ZMqcI2CxlY1WOZRghOboYzGmg6nMTiHQre0yx1tUxHHvmcKYuHq4hsE3aBFAQQvPuocX
         iXxA==
X-Gm-Message-State: AOJu0Yx+ampEvN1qH53Hbb/fqJBGjhDcZIKOSvoUS++Y6pBDtUN21Gxh
	vcDIgF20VSEEfTzN8x/luQZPJ9uIFZVTs0xCsMs2zuygU3h8qySnsTYqEdmVhuLYPKk8Rnc/wHj
	ploy0TYWDrt+tgfIsbfTjd7NhAQuI5GG2zsS/8emJI3z3f/As8x9ezMvXoYK2MGI=
X-Received: by 2002:ac2:58e4:0:b0:50c:ab3:796c with SMTP id v4-20020ac258e4000000b0050c0ab3796cmr124642lfo.90.1701837364913;
        Tue, 05 Dec 2023 20:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnZmCNCqJT0UPpfWdUXaVyYNAy45B5LVYnR6hymhwG6T6/AyaqNMJ1ieoJneGRXxknggl6sLI5amiiFe31eJs=
X-Received: by 2002:ac2:58e4:0:b0:50c:ab3:796c with SMTP id
 v4-20020ac258e4000000b0050c0ab3796cmr124640lfo.90.1701837364578; Tue, 05 Dec
 2023 20:36:04 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com> <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
 <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com> <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com> <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <20231204035211-mutt-send-email-mst@kernel.org> <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org> <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com> <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
In-Reply-To: <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Dec 2023 12:35:53 +0800
Message-ID: <CACGkMEsEa4s+1fPqCt1pGaFZczG4NjUsMZk9SfTD98MVUQ7e=g@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update
 description for VIRTIO_NET_F_GUEST_CSUM.

On Tue, Dec 5, 2023 at 10:18=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:52, Jason Wang =E5=86=99=E9=81=
=93:
> > On Mon, Dec 4, 2023 at 5:34=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.co=
m> wrote:
> >>
> >>
> >> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=885:05, Michael S. Tsirkin =E5=86=
=99=E9=81=93:
> >>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> >>>> On Mon, Dec 4, 2023 at 4:53=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> >>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> >>>>>> On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi <hengqi@linux.aliba=
ba.com> wrote:
> >>>>>>>
> >>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=99=
=E9=81=93:
> >>>>>>>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux.ali=
baba.com> wrote:
> >>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=86=
=99=E9=81=93:
> >>>>>>>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@linux.a=
libaba.com> wrote:
> >>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=86=99=
=E9=81=93:
> >>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =E5=
=86=99=E9=81=93:
> >>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi@lin=
ux.alibaba.com>
> >>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wang =
=E5=86=99=E9=81=93:
> >>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <hengqi@l=
inux.alibaba.com>
> >>>>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>>>> To prevent readers from misunderstanding that the driver=
 can
> >>>>>>>>>>>>>>>> only handles packets with partial checksum when
> >>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the des=
cription.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> >>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>        device-types/net/description.tex | 2 +-
> >>>>>>>>>>>>>>>>        1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
> >>>>>>>>>>>>>>>> b/device-types/net/description.tex
> >>>>>>>>>>>>>>>> index aff5e08..529f470 100644
> >>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:De=
vice Types
> >>>>>>>>>>>>>>>> / Network Device / Feature bits
> >>>>>>>>>>>>>>>>        \begin{description}
> >>>>>>>>>>>>>>>>        \item[VIRTIO_NET_F_CSUM (0)] Device handles packe=
ts with
> >>>>>>>>>>>>>>>> partial checksum offload.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packe=
ts with
> >>>>>>>>>>>>>>>> partial checksum.
> >>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packe=
ts with
> >>>>>>>>>>>>>>>> partial checksum or full checksum.
> >>>>>>>>>>>>>>> So patch 2 said
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver handles =
packets with
> >>>>>>>>>>>>>>> full checksum.
> >>>>>>>>>>>>>>>        \end{description}
> >>>>>>>>>>>>>>> "
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Is there any difference between the two "full checksum" h=
ere?
> >>>>>>>>>>>>>> There's no difference.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means that t=
he driver
> >>>>>>>>>>>>>> "can
> >>>>>>>>>>>>>> only" handle packets with full checksum.
> >>>>>>>>>>>>> This seems to be odd.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Driver can always handle packet with full checksum, no?
> >>>>>>>>>>>> Yes.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> I meant it
> >>>>>>>>>>>>> will be then to be functional equivalent to !
> >>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> >>>>>>>>>>>> Are you referring to
> >>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> >>>>>>>>>>> Sorry, this is a typo. I meant
> >>>>>>>>>>>
> >>>>>>>>>>> Are you referring to
> >>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> >>>>>>>>>>>
> >>>>>>>>>>>> If so, I think it's no.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Maybe a description similar to the following would be more c=
learer:
> >>>>>>>>>>>>
> >>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does not ha=
ndle
> >>>>>>>>>>>> packets with partial checksum.
> >>>>>>>>>> I may miss something here, but what's the difference between
> >>>>>>>>>>
> >>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> >>>>>>>>>>
> >>>>>>>>>> and
> >>>>>>>>>>
> >>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
> >>>>>>>>>     From the device perspective:
> >>>>>>>>>
> >>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets with f=
ull
> >>>>>>>>> checksum to the driver,
> >>>>>>>>> but the device can not validate the checksum for these packets.=
 That is,
> >>>>>>>>> the flags in virtio-net-hdr
> >>>>>>>>> will not contain _DATA_VALID, and the driver or stack needs to =
validate
> >>>>>>>>> these packets.
> >>>>>>>>>
> >>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packets wi=
th full
> >>>>>>>>> checksum to the driver,
> >>>>>>>>> and the device can validate the checksum for these packets. Tha=
t is, the
> >>>>>>>>> flags in virtio-net-hdr
> >>>>>>>>> will contain _DATA_VALID,
> >>>>>>>> I think DATA_VALID is optional here as device can't recognize al=
l type
> >>>>>>>> of protocols.
> >>>>>>> Yes, you are right, so I used "device *can*" here. Which packet t=
ypes
> >>>>>>> the device recognizes or validates
> >>>>>>> depends on the device's implementation. This is also the current
> >>>>>>> practice of GUEST_CSUM.
> >>>>>>>
> >>>>>>>>> and the driver or stack does not need to
> >>>>>>>>> validate these packets.
> >>>>>>>> Ok, so I think there're something that is subtle here,
> >>>>>>> Ok, I see.
> >>>>>>>
> >>>>>>>> and that's why
> >>>>>>>> I'm asking here:
> >>>>>>>>
> >>>>>>>> 1) "Driver does not handle packets with partial checksum" is not
> >>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
> >>>>>>>> 2) "Driver handles packets with full checksum" is kind of ambigu=
ous as
> >>>>>>>> it doesn't say whether or not the packet has been validated or n=
ot.
> >>>>>>> Maybe the description below would be less subtle?
> >>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with p=
artial
> >>>>>>> checksum or full checksum.
> >>>>>> I'd suggest to leave it as is. As I didn't find any issue since ev=
en
> >>>>>> with DATA_VALID. Did you?
> >>>>>>
> >>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles pack=
ets
> >>>>>>> with full checksum,
> >>>>>>> and the device optionally validates the packet's checksum.
> >>>>>> Or maybe something like (not a native speaker)
> >>>>>>
> >>>>>> The driver handles packets with full checksum which the device has
> >>>>>> already validated.
> >>>>>>
> >>>>>> Thanks
> >>>>> I feel we just need a proper definition of what does "full checksum=
"
> >>>>> mean in this context. It is used but not defined.
> >>>>> Assume this feature was negotiated.
> >>>>> My understanding is that this is just like VIRTIO_NET_F_GUEST_CSUM
> >>>>> but certain values in the header are then disallowed? Which?
> >>>>> This should be in the spec.
> >>>> Yes, I think it is probably the headers that DATA_VALID can work. We
> >>>> never define it in the past.
> >>>>
> >>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY, but it c=
an
> >>>> only work for some specific protocols:
> >>>>
> >>>> """
> >>>>    *   %CHECKSUM_UNNECESSARY is applicable to following protocols:
> >>>>    *
> >>>>    *     - TCP: IPv6 and IPv4.
> >>>>    *     - UDP: IPv4 and IPv6. A device may apply CHECKSUM_UNNECESSA=
RY to a
> >>>>    *       zero UDP checksum for either IPv4 or IPv6, the networking=
 stack
> >>>>    *       may perform further validation in this case.
> >>>>    *     - GRE: only if the checksum is present in the header.
> >>>>    *     - SCTP: indicates the CRC in SCTP header has been validated=
.
> >>>>    *     - FCOE: indicates the CRC in FC frame has been validated.
> >>>> """
> >>>>
> >>>> I'm not sure whether it's just fine to duplicate the definition or
> >>>> it's too late to define any now.
> >>> I think it's mostly harmless for other protocols.
> >> I'm not sure if this should be defined by a new FULL_CSUM feature.
> >> This seems to be an issue with GUEST_CSUM.
> >>
> >> I think we should supplement these with a new patch for GUEST_CSUM?
> > Probably. My understanding is:
> >
> > You want to reuse DATA_VALID here, so we need to stick to a consistent
> > semantic for GUEST_CUSM and FULL_CSUM. So we need a definition of
> > "full csum" or what kind of packet could DATA_VALID work here.
>
> I agree, we can be clear about what types of packets DATA_VALID might
> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
>
> But I think we also need something like \field{supported_validate_types} =
to
> indicate which packet types the device supports validating and setting
> DATA_VALID,
> otherwise the device driver that negotiates this feature may fail to
> live migration.
> Am I right?

Probably, but I think most devices only do this for TCP/UDP packets
now, so we are fine.

>
> I'm not sure how GUEST_CSUM works now as it should also suffer from the
> above
> mentioned issues with live migration, but no devices are reporting this
> right now.
>
> Maybe, each device only supports checksum verification for TCP/UDP by
> default?

Maybe.

Thanks

> I don't know.
> But I hope we can focus on this and get consensus, because our hw
> release date is coming soon.
>
> Thanks a lot!
>
> >
> > Thanks
> >
> >> Thanks!
> >>
> >>>>> After this is written up we will come up with a good short
> >>>>> description for the feature bit.
> >>>>>
> >>>> Thanks
> >>>>
> >>>>>>> Thanks!
> >>>>>>>
> >>>>>>>> Thanks
> >>>>>>>>
> >>>>>>>>> Thanks!
> >>>>>>>>>
> >>>>>>>>>> Thanks
> >>>>>>>>>>
> >>>>>>>>>>>> Thanks!
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Thanks
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> Thanks!
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Thanks
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control chan=
nel offloads
> >>>>>>>>>>>>>>>>                reconfiguration support.
> >>>>>>>>>>>>>>>> --
> >>>>>>>>>>>>>>>> 2.19.1.6.gb485710b
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>> This publicly archived list offers a means to provide input =
to the
> >>>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In order to verify user consent to the Feedback License term=
s and
> >>>>>>>>>>>> to minimize spam in the list archive, subscription is requir=
ed
> >>>>>>>>>>>> before posting.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-c=
omment/
> >>>>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedbac=
k_license.pdf
> >>>>>>>>>>>> List Guidelines:
> >>>>>>>>>>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
> >>>>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>>> This publicly archived list offers a means to provide input to =
the
> >>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>>>
> >>>>>>>>> In order to verify user consent to the Feedback License terms a=
nd
> >>>>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>>>> before posting.
> >>>>>>>>>
> >>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comm=
ent/
> >>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_l=
icense.pdf
> >>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines=
/mailing-lists
> >>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>>>
> >>>>>>> This publicly archived list offers a means to provide input to th=
e
> >>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>>>
> >>>>>>> In order to verify user consent to the Feedback License terms and
> >>>>>>> to minimize spam in the list archive, subscription is required
> >>>>>>> before posting.
> >>>>>>>
> >>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-commen=
t/
> >>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_lic=
ense.pdf
> >>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/m=
ailing-lists
> >>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>>>
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

