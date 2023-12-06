Return-Path: <virtio-comment-return-8750-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB90C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 08:08:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 612FD2AC4A
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 08:08:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 379839868F3
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 08:08:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1C3EF9866AB; Wed,  6 Dec 2023 08:08:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F0529866AE
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 08:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VxxKgpU_1701850126;
Message-ID: <1701849446.0349424-5-xuanzhuo@linux.alibaba.com>
Date: Wed, 6 Dec 2023 15:57:26 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment@lists.oasis-open.org,
 Heng Qi <hengqi@linux.alibaba.com>
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
 <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
 <CACGkMEuN20TaSF1OeFgwEF85ZadxPomnsoMmprS3=DpCFPJKhQ@mail.gmail.com>
 <90ef9ec4-6cce-49c4-a27d-7168990ae3f3@linux.alibaba.com>
 <CACGkMEu3M6D0TXgm7b89mKosGF37x2YJhj+kVb0RQ=sZJ+vQqA@mail.gmail.com>
 <5bb13b60-f324-412f-99a2-a476320d79b1@linux.alibaba.com>
 <00b1ed5f-fc91-4aba-b650-2830cd5ac412@linux.alibaba.com>
 <CACGkMEsz_6DQtsErd+V0kKSzm=TLxvSgk_Fbhyysa-w41CXSwQ@mail.gmail.com>
 <b37db3db-ffb8-4fce-9ec9-2fc248fd57df@linux.alibaba.com>
 <CACGkMEsMhuNX3YzAAV52uDD_FWqPq8LdtQsx5EnWaqQn4RmDVg@mail.gmail.com>
 <68223a13-9124-4b44-aac7-851ab9bddf90@linux.alibaba.com>
 <CACGkMEvgJ-c3i4FSOMQSn=XcGOi2Be4gTS=rjB10KnADkrpw_Q@mail.gmail.com>
 <20231204035211-mutt-send-email-mst@kernel.org>
 <CACGkMEs=aM1n95xWkwJMCrbT1+sW1kHO=r0eMR-07OhrdPW8kw@mail.gmail.com>
 <20231204040528-mutt-send-email-mst@kernel.org>
 <4dee1860-4790-4217-b13f-3259172b653c@linux.alibaba.com>
 <CACGkMEtDTGafzOo1=-9LDhpQByA9Y=6NtPpUibLc=EVwC4CYXA@mail.gmail.com>
 <d11b39dc-a74b-4bde-9c2d-d7dae09f3c71@linux.alibaba.com>
 <20231205094318-mutt-send-email-mst@kernel.org>
 <bba2c20b-0f61-43f3-81e5-3311144e6208@linux.alibaba.com>
 <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
In-Reply-To: <CACGkMEuGvz0xy9aML4oBJoStx-DW93LnGDdh6JMXyw3AhrgExA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v4 1/2] virtio-net: update description for VIRTIO_NET_F_GUEST_CSUM.

On Wed, 6 Dec 2023 12:36:53 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Wed, Dec 6, 2023 at 10:21=E2=80=AFAM Heng Qi <hengqi@linux.alibaba.com=
> wrote:
> >
> >
> >
> > =E5=9C=A8 2023/12/5 =E4=B8=8B=E5=8D=8810:45, Michael S. Tsirkin =E5=86=
=99=E9=81=93:
> > > On Tue, Dec 05, 2023 at 10:18:32PM +0800, Heng Qi wrote:
> > >>
> > >> =E5=9C=A8 2023/12/5 =E4=B8=8A=E5=8D=8811:52, Jason Wang =E5=86=99=E9=
=81=93:
> > >>> On Mon, Dec 4, 2023 at 5:34=E2=80=AFPM Heng Qi <hengqi@linux.alibab=
a.com> wrote:
> > >>>>
> > >>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=885:05, Michael S. Tsirkin =E5=
=86=99=E9=81=93:
> > >>>>> On Mon, Dec 04, 2023 at 04:59:49PM +0800, Jason Wang wrote:
> > >>>>>> On Mon, Dec 4, 2023 at 4:53=E2=80=AFPM Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > >>>>>>> On Mon, Dec 04, 2023 at 04:49:46PM +0800, Jason Wang wrote:
> > >>>>>>>> On Mon, Dec 4, 2023 at 3:37=E2=80=AFPM Heng Qi <hengqi@linux.a=
libaba.com> wrote:
> > >>>>>>>>> =E5=9C=A8 2023/12/4 =E4=B8=8B=E5=8D=883:18, Jason Wang =E5=86=
=99=E9=81=93:
> > >>>>>>>>>> On Fri, Dec 1, 2023 at 3:16=E2=80=AFPM Heng Qi <hengqi@linux=
.alibaba.com> wrote:
> > >>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=883:05, Jason Wang =E5=
=86=99=E9=81=93:
> > >>>>>>>>>>>> On Fri, Dec 1, 2023 at 2:30=E2=80=AFPM Heng Qi <hengqi@lin=
ux.alibaba.com> wrote:
> > >>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=882:24, Heng Qi =E5=
=86=99=E9=81=93:
> > >>>>>>>>>>>>>> =E5=9C=A8 2023/12/1 =E4=B8=8B=E5=8D=881:18, Jason Wang =
=E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>> On Wed, Nov 29, 2023 at 4:23=E2=80=AFPM Heng Qi <hengqi=
@linux.alibaba.com>
> > >>>>>>>>>>>>>>> wrote:
> > >>>>>>>>>>>>>>>> =E5=9C=A8 2023/11/29 =E4=B8=8B=E5=8D=884:00, Jason Wan=
g =E5=86=99=E9=81=93:
> > >>>>>>>>>>>>>>>>> On Tue, Nov 28, 2023 at 4:08=E2=80=AFPM Heng Qi <heng=
qi@linux.alibaba.com>
> > >>>>>>>>>>>>>>>>> wrote:
> > >>>>>>>>>>>>>>>>>> To prevent readers from misunderstanding that the dr=
iver can
> > >>>>>>>>>>>>>>>>>> only handles packets with partial checksum when
> > >>>>>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the=
 description.
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > >>>>>>>>>>>>>>>>>> ---
> > >>>>>>>>>>>>>>>>>>         device-types/net/description.tex | 2 +-
> > >>>>>>>>>>>>>>>>>>         1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> diff --git a/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>> b/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>> index aff5e08..529f470 100644
> > >>>>>>>>>>>>>>>>>> --- a/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>> +++ b/device-types/net/description.tex
> > >>>>>>>>>>>>>>>>>> @@ -38,7 +38,7 @@ \subsection{Feature bits}\label{se=
c:Device Types
> > >>>>>>>>>>>>>>>>>> / Network Device / Feature bits
> > >>>>>>>>>>>>>>>>>>         \begin{description}
> > >>>>>>>>>>>>>>>>>>         \item[VIRTIO_NET_F_CSUM (0)] Device handles =
packets with
> > >>>>>>>>>>>>>>>>>> partial checksum offload.
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> -\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles p=
ackets with
> > >>>>>>>>>>>>>>>>>> partial checksum.
> > >>>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles p=
ackets with
> > >>>>>>>>>>>>>>>>>> partial checksum or full checksum.
> > >>>>>>>>>>>>>>>>> So patch 2 said
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> "
> > >>>>>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver hand=
les packets with
> > >>>>>>>>>>>>>>>>> full checksum.
> > >>>>>>>>>>>>>>>>>         \end{description}
> > >>>>>>>>>>>>>>>>> "
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> Is there any difference between the two "full checksu=
m" here?
> > >>>>>>>>>>>>>>>> There's no difference.
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> The core is that VIRTIO_NET_F_GUEST_FULL_CSUM means th=
at the driver
> > >>>>>>>>>>>>>>>> "can
> > >>>>>>>>>>>>>>>> only" handle packets with full checksum.
> > >>>>>>>>>>>>>>> This seems to be odd.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Driver can always handle packet with full checksum, no?
> > >>>>>>>>>>>>>> Yes.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> I meant it
> > >>>>>>>>>>>>>>> will be then to be functional equivalent to !
> > >>>>>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM?
> > >>>>>>>>>>>>>> Are you referring to
> > >>>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_CSUM" ?
> > >>>>>>>>>>>>> Sorry, this is a typo. I meant
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> Are you referring to
> > >>>>>>>>>>>>> "functional equivalent to !VIRTIO_NET_F_GUEST_FULL_CSUM" ?
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>>> If so, I think it's no.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> Maybe a description similar to the following would be mo=
re clearer:
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] Driver does no=
t handle
> > >>>>>>>>>>>>>> packets with partial checksum.
> > >>>>>>>>>>>> I may miss something here, but what's the difference betwe=
en
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> VIRTIO_NET_F_GUEST_FULL_CSUM
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> and
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> !VIRTIO_NET_F_GUEST_CSUM?
> > >>>>>>>>>>>      From the device perspective:
> > >>>>>>>>>>>
> > >>>>>>>>>>> If !VIRTIO_NET_F_GUEST_CSUM, the device delivers packets wi=
th full
> > >>>>>>>>>>> checksum to the driver,
> > >>>>>>>>>>> but the device can not validate the checksum for these pack=
ets. That is,
> > >>>>>>>>>>> the flags in virtio-net-hdr
> > >>>>>>>>>>> will not contain _DATA_VALID, and the driver or stack needs=
 to validate
> > >>>>>>>>>>> these packets.
> > >>>>>>>>>>>
> > >>>>>>>>>>> If VIRTIO_NET_F_GUEST_FULL_CSUM, the device delivers packet=
s with full
> > >>>>>>>>>>> checksum to the driver,
> > >>>>>>>>>>> and the device can validate the checksum for these packets.=
 That is, the
> > >>>>>>>>>>> flags in virtio-net-hdr
> > >>>>>>>>>>> will contain _DATA_VALID,
> > >>>>>>>>>> I think DATA_VALID is optional here as device can't recogniz=
e all type
> > >>>>>>>>>> of protocols.
> > >>>>>>>>> Yes, you are right, so I used "device *can*" here. Which pack=
et types
> > >>>>>>>>> the device recognizes or validates
> > >>>>>>>>> depends on the device's implementation. This is also the curr=
ent
> > >>>>>>>>> practice of GUEST_CSUM.
> > >>>>>>>>>
> > >>>>>>>>>>> and the driver or stack does not need to
> > >>>>>>>>>>> validate these packets.
> > >>>>>>>>>> Ok, so I think there're something that is subtle here,
> > >>>>>>>>> Ok, I see.
> > >>>>>>>>>
> > >>>>>>>>>> and that's why
> > >>>>>>>>>> I'm asking here:
> > >>>>>>>>>>
> > >>>>>>>>>> 1) "Driver does not handle packets with partial checksum" is=
 not
> > >>>>>>>>>> accurate, !GUEST_CUSM also fit for this definition.
> > >>>>>>>>>> 2) "Driver handles packets with full checksum" is kind of am=
biguous as
> > >>>>>>>>>> it doesn't say whether or not the packet has been validated =
or not.
> > >>>>>>>>> Maybe the description below would be less subtle?
> > >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets wi=
th partial
> > >>>>>>>>> checksum or full checksum.
> > >>>>>>>> I'd suggest to leave it as is. As I didn't find any issue sinc=
e even
> > >>>>>>>> with DATA_VALID. Did you?
> > >>>>>>>>
> > >>>>>>>>> +\item[VIRTIO_NET_F_GUEST_FULL_CSUM (64)] The driver handles =
packets
> > >>>>>>>>> with full checksum,
> > >>>>>>>>> and the device optionally validates the packet's checksum.
> > >>>>>>>> Or maybe something like (not a native speaker)
> > >>>>>>>>
> > >>>>>>>> The driver handles packets with full checksum which the device=
 has
> > >>>>>>>> already validated.
> > >>>>>>>>
> > >>>>>>>> Thanks
> > >>>>>>> I feel we just need a proper definition of what does "full chec=
ksum"
> > >>>>>>> mean in this context. It is used but not defined.
> > >>>>>>> Assume this feature was negotiated.
> > >>>>>>> My understanding is that this is just like VIRTIO_NET_F_GUEST_C=
SUM
> > >>>>>>> but certain values in the header are then disallowed? Which?
> > >>>>>>> This should be in the spec.
> > >>>>>> Yes, I think it is probably the headers that DATA_VALID can work=
. We
> > >>>>>> never define it in the past.
> > >>>>>>
> > >>>>>> E.g in the Linux we map DATA_VALID to CHECKSUM_UNNECESSARY, but =
it can
> > >>>>>> only work for some specific protocols:
> > >>>>>>
> > >>>>>> """
> > >>>>>>     *   %CHECKSUM_UNNECESSARY is applicable to following protoco=
ls:
> > >>>>>>     *
> > >>>>>>     *     - TCP: IPv6 and IPv4.
> > >>>>>>     *     - UDP: IPv4 and IPv6. A device may apply CHECKSUM_UNNE=
CESSARY to a
> > >>>>>>     *       zero UDP checksum for either IPv4 or IPv6, the netwo=
rking stack
> > >>>>>>     *       may perform further validation in this case.
> > >>>>>>     *     - GRE: only if the checksum is present in the header.
> > >>>>>>     *     - SCTP: indicates the CRC in SCTP header has been vali=
dated.
> > >>>>>>     *     - FCOE: indicates the CRC in FC frame has been validat=
ed.
> > >>>>>> """
> > >>>>>>
> > >>>>>> I'm not sure whether it's just fine to duplicate the definition =
or
> > >>>>>> it's too late to define any now.
> > >>>>> I think it's mostly harmless for other protocols.
> > >>>> I'm not sure if this should be defined by a new FULL_CSUM feature.
> > >>>> This seems to be an issue with GUEST_CSUM.
> > >>>>
> > >>>> I think we should supplement these with a new patch for GUEST_CSUM?
> > >>> Probably. My understanding is:
> > >>>
> > >>> You want to reuse DATA_VALID here, so we need to stick to a consist=
ent
> > >>> semantic for GUEST_CUSM and FULL_CSUM. So we need a definition of
> > >>> "full csum" or what kind of packet could DATA_VALID work here.
> > >> I agree, we can be clear about what types of packets DATA_VALID might
> > >> cover, e.g. TCP/UDP/GRE/SCTP/FoCE.
> > >>
> > >> But I think we also need something like \field{supported_validate_ty=
pes} to
> > >> indicate which packet types the device supports validating and setti=
ng
> > >> DATA_VALID,
> > >> otherwise the device driver that negotiates this feature may fail to=
 live
> > >> migration.
> > >> Am I right?
> > >>
> > >> I'm not sure how GUEST_CSUM works now as it should also suffer from =
the
> > >> above
> > >> mentioned issues with live migration, but no devices are reporting t=
his
> > >> right now.
> > >>
> > >> Maybe, each device only supports checksum verification for TCP/UDP by
> > >> default? I don't know.
> > >> But I hope we can focus on this and get consensus, because our hw re=
lease
> > >> date is coming soon.
> > >>
> > >> Thanks a lot!
> > >
> > > First, DATA_VALID is not a thing that hardware should ever use.
> > > It's a hack when packets are passed within host.
> >
> > Get here. Thanks!
>
> So if I understand correctly, we need a new flag here and define the
> supported protocols.


For what, migration?

I don't think so.

Every packet has the flag(valid or none). The guest will check this flag.
If we support this flag in config, the driver need to check this?

For migration, if we want to migrate one from src to dst.
If the src device supports tcp and udp checksum and
the dst device just supports tcp checksum.
I think we should not migrate to this dst device. But this process
does not need the involvement of the driver.

But for describing the supported protocols, I think that is ok.
We lost that for GUEST_CSUM, we should not lost again for the new one.

Thanks.




>
> Thanks
>
> >
> > > Second I don't understand what it has to do with this
> > > discussion.
> > > Your patch should be more specific and define which
> > > header fields are compatible with the new offload option.
> > >
> > >
> > >
> > >>> Thanks
> > >>>
> > >>>> Thanks!
> > >>>>
> > >>>>>>> After this is written up we will come up with a good short
> > >>>>>>> description for the feature bit.
> > >>>>>>>
> > >>>>>> Thanks
> > >>>>>>
> > >>>>>>>>> Thanks!
> > >>>>>>>>>
> > >>>>>>>>>> Thanks
> > >>>>>>>>>>
> > >>>>>>>>>>> Thanks!
> > >>>>>>>>>>>
> > >>>>>>>>>>>> Thanks
> > >>>>>>>>>>>>
> > >>>>>>>>>>>>>> Thanks!
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Thanks
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>> Thanks!
> > >>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> Thanks
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control =
channel offloads
> > >>>>>>>>>>>>>>>>>>                 reconfiguration support.
> > >>>>>>>>>>>>>>>>>> --
> > >>>>>>>>>>>>>>>>>> 2.19.1.6.gb485710b
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> This publicly archived list offers a means to provide in=
put to the
> > >>>>>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> In order to verify user consent to the Feedback License =
terms and
> > >>>>>>>>>>>>>> to minimize spam in the list archive, subscription is re=
quired
> > >>>>>>>>>>>>>> before posting.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > >>>>>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open=
.org
> > >>>>>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> > >>>>>>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virt=
io-comment/
> > >>>>>>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/fee=
dback_license.pdf
> > >>>>>>>>>>>>>> List Guidelines:
> > >>>>>>>>>>>>>> https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> > >>>>>>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > >>>>>>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> > >>>>>>>>>>> This publicly archived list offers a means to provide input=
 to the
> > >>>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > >>>>>>>>>>>
> > >>>>>>>>>>> In order to verify user consent to the Feedback License ter=
ms and
> > >>>>>>>>>>> to minimize spam in the list archive, subscription is requi=
red
> > >>>>>>>>>>> before posting.
> > >>>>>>>>>>>
> > >>>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > >>>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > >>>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> > >>>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-=
comment/
> > >>>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedba=
ck_license.pdf
> > >>>>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidel=
ines/mailing-lists
> > >>>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > >>>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> > >>>>>>>>>>>
> > >>>>>>>>> This publicly archived list offers a means to provide input t=
o the
> > >>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > >>>>>>>>>
> > >>>>>>>>> In order to verify user consent to the Feedback License terms=
 and
> > >>>>>>>>> to minimize spam in the list archive, subscription is required
> > >>>>>>>>> before posting.
> > >>>>>>>>>
> > >>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > >>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > >>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> > >>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-co=
mment/
> > >>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback=
_license.pdf
> > >>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelin=
es/mailing-lists
> > >>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > >>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> > >>>>>>>>>
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/maili=
ng-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> >
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

