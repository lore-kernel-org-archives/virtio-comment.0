Return-Path: <virtio-comment-return-8896-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB52CC3DA6E
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:48:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2D68E2AF7E
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:48:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16E31986324
	for <virtio-comment@archiver.kernel.org>; Mon,  8 Jan 2024 03:48:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0347998620A; Mon,  8 Jan 2024 03:48:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E86F198620C
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 Jan 2024 03:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gYU_oLoKM0SdupUIAYa71g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704685705; x=1705290505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Nr2kN08Rlv6FEUlbYarg9pyaSt3wjH/JonJEOOB8oQ=;
        b=vBspaKLBpbAIyO/R1MVQmD01uYuvU7UT74rh5nzcCv8cedbI0KsvFL1B95a7/7QQ5c
         p0Jw0kf1MexDtHIukDA05yfhzVuc7vcTh6nkOsYUXyDf+0hyVsyGk1h/UzPZwP4vMHHn
         3dq0XjAxY+r+Mbd7sbWmnbVr9bCS5w2tmyJFAt/x9fztRkIp4uOp28M+BmEbH7xR3nvr
         1UHFQO6Rla4G44DgKcojsL03dZqzoEZFWNgiupLz8I/qVbOZxlj6lH+yu1lTEJwm7Iie
         dft6EtCOEv6+1/C8DdaODKGhWkN/EHcWn+g9YXmwd9FkXnp3sfGuHWQaO3I4UVLiML3h
         CWpg==
X-Gm-Message-State: AOJu0YwE4nGrXXsbtgqwXHJJozF2JOaJxBGKWncGg1lexIjyYHEzL+PN
	9B94CqeSdEJ91weoXIamvf16MQv+MOrdqFvAzNjOZ9m3Oy+oyrN6Knle2B1aPDcFAkRbi2Gm8LX
	tmLvqh+s+oTh7/C4rWcLOQv8N3O0nBVjxJpe57Y/Sysqdydp41jnAKxHoPg==
X-Received: by 2002:a17:90a:6e02:b0:28b:e98d:aaeb with SMTP id b2-20020a17090a6e0200b0028be98daaebmr1114486pjk.23.1704685705591;
        Sun, 07 Jan 2024 19:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFaZFccCuTkJbmYtlfgWDXZ0uPDzkDgRuJM2igcs0kaRIPmQy3IO4Uxx2+wpaWBMrUONmgrtTbnWRaru4M7kk=
X-Received: by 2002:a17:90a:6e02:b0:28b:e98d:aaeb with SMTP id
 b2-20020a17090a6e0200b0028be98daaebmr1114479pjk.23.1704685705223; Sun, 07 Jan
 2024 19:48:25 -0800 (PST)
MIME-Version: 1.0
References: <1704263702-50528-1-git-send-email-hengqi@linux.alibaba.com> <9f223f31-d82d-4554-817b-d46327a9cdee@linux.alibaba.com>
In-Reply-To: <9f223f31-d82d-4554-817b-d46327a9cdee@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 Jan 2024 11:48:14 +0800
Message-ID: <CACGkMEv6=7hJdEwgPWDXudYW_+UVed2h6+w8kgu2RPfAyCH9YQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] [PATCH v8] virtio-net: correct
 conditions for devices to validate packet checksum

On Thu, Jan 4, 2024 at 12:47=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:
>
>
>
> =E5=9C=A8 2024/1/3 =E4=B8=8B=E5=8D=882:35, Heng Qi =E5=86=99=E9=81=93:
> > There is a historical error in virtio spec:
> >    "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set=
 flags
> >     to zero and SHOULD supply a fully checksummed packet to the driver.=
"
> >
> > Currently in Linux and virtio-related implementations, the device valid=
ates
> > the packet checksum and sets DATA_VALID regardless of whether
> > VIRTIO_NET_F_GUEST_CSUM is negotiated.
> >
> > Please refer to the following summary and thread[1] for details and rea=
sons:
> >
> > Summary
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 1. GUEST_CSUM at virtio spec 0.95 is intended to be compatible with par=
tially
> > checksummed packets (NEEDS_CSUM <-> CHECKSUM_PARTIAL). So GUEST_CSUM is=
 mapped
> > to NETIF_F_RXCSUM.
> > GUEST_CSUM only indicates whether the driver handles partially checksum=
med packets.
> > When XDP is loaded, the GUEST_CSUM's offload will be disabled, which me=
ans that
> > packets have NEEDS_CSUM set will be dropped, and packets have DATA_VALI=
D set will
> > still be received.
> >
> > 2. When DATA_VALID was added to Linux in 2011[2] and virtio1.0, it was =
actually
> > expected that rx checksum offload (the driver can set CHECKSUM_UNNECESS=
ARY) had
> > nothing to do with whether GUEST_CSUM was negotiated. But due to an err=
or, below
> > desctiption was added incorrectly:
> >    "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device *MUST* set=
 flags
> >     to zero and SHOULD supply a fully checksummed packet to the driver.=
"
> >
> > 3. We now hope to correct this error. Let the setting of DATA_VALID not=
 be
> > controlled by whether GUEST_CSUM is negotiated, but only controlled by =
whether
> > rx checksum offload is enabled on the OS side. The state of this rx che=
cksum
> > offload is not aware of the device.
> >
> > 4. [Optional] NETIF_F_RXCSUM corresponding to rx checksum offload shoul=
d be
> > added to dev->hw_features. When the user turns off rx checksum offload =
through
> > ethtool -K, neither NEEDS_CSUM nor DATA_VALID should be taken care of, =
that is,
> > all packets will be marked as CHECKSUM_NONE.
> >
> > Related Link
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [1] https://lists.oasis-open.org/archives/virtio-comment/202312/msg0013=
5.html
> > [2] 10a8d94a9574 ("virtio_net: introduce VIRTIO_NET_HDR_F_DATA_VALID")
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/185
>
> Hi Michael, Cornelia.
>
> Could you please open a voting for this fix?
>
> Thanks a lot!

Patch looks good to me.

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> >
> > Suggested-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > ---
> > v7->v8:
> > - Drop the new FULLY_CSUM feature and optimize the description. @Jason
> >
> > v6->v7:
> > - FULLY_CSUM no longer depends on GUEST_CSUM.
> > - The description related to DATA_VALID has nothing to do with
> >    whether GUEST_CSUM is negotiated or not. @Jason
> >
> > v5->v6:
> > - Rewrite and clarify patch description. @Michael
> >
> > v4->v5:
> > - Remove the modification to the GUEST_CSUM. @Jason
> > - The description of this feature has been reorganized for greater clar=
ity. @Michael
> >
> > v3->v4:
> > - Streamline some repetitive descriptions. @Jason
> > - Add how features should work, when to be enabled, and overhead. @Jaso=
n @Michael
> >
> > v2->v3:
> > - Add a section named "Driver Handles Fully Checksummed Packets"
> >    and more descriptions. @Michael
> >
> > v1->v2:
> > - Modify full checksum functionality as a configurable offload
> >    that is initially turned off. @Jason
> >
> >   device-types/net/description.tex | 14 +++-----------
> >   1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-types/net/descri=
ption.tex
> > index aff5e08..14978c0 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -723,8 +723,7 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
> >     \field{num_buffers} is one, then the entire packet will be
> >     contained within this buffer, immediately following the struct
> >     virtio_net_hdr.
> > -\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > -  VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> > +\item The VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >     set: if so, device has validated the packet checksum.
> >     In case of multiple encapsulated protocols, one level of checksums
> >     has been validated.
> > @@ -783,9 +782,8 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
> >   packet together, such that at least \field{num_buffers} are
> >   observed by driver as used.
> >
> > -If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device MUST set
> > -\field{flags} to zero and SHOULD supply a fully checksummed
> > -packet to the driver.
> > +If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device SHOULD supply
> > +a fully checksummed packet to the driver.
> >
> >   If VIRTIO_NET_F_GUEST_TSO4 is not negotiated, the device MUST NOT set
> >   \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4.
> > @@ -842,12 +840,6 @@ \subsubsection{Processing of Incoming Packets}\lab=
el{sec:Device Types / Network
> >   not less than the length of the headers, including the transport
> >   header.
> >
> > -If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
> > -device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
> > -\field{flags}, if so, the device MUST validate the packet
> > -checksum (in case of multiple encapsulated protocols, one level
> > -of checksums is validated).
> > -
> >   \drivernormative{\paragraph}{Processing of Incoming
> >   Packets}{Device Types / Network Device / Device Operation /
> >   Processing of Incoming Packets}
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

