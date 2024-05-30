Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF979208A9
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 16:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717085386; cv=none; b=NVIlT2DqtGkg+q2gZ2TMHSPmmFuTRLdoxv4zFYC+v/rhaolJB7otyBZuHPsSwj7UsTT1JZ7dF02KzeKSI5QdP87p9IK5828uAfTOqgfoS6ZsGQ0jUrUsdOLukI8B7hsALHVoDzu+Z8u2+J8Fclg1d5YThhmze7ibP1jWLIbjvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717085386; c=relaxed/simple;
	bh=1LSrhk6h8k5vdwtTvsh0rC3MFf+agScj5hf57Nrmi5Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2kgVRjEcKM5Nh5lvrxC0ZujsFYs8zMHN/To0GGCb479YtQuM98LA/T9Jp2qrJ8yegmzaXw46yA7hPVEeVO6ttqk6p7lzRGoQfT/pTFJ3PuUAs90CWxR5Ns052nDuPDuvHkwfbJTPsr4WE8Pbq2MD8eQ5Il/GyXxNKIeJaCYveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ps+nGrGG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ps+nGrGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717085383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zmAWYa3Wn5pwGCJRKhtYAwe8ICl8pqH0+HJasGP6qig=;
	b=Ps+nGrGGNJGzsaGQ3ww090kJSLinTmvXx4MJSWiW0bepc4oRHpaDgLVh+vLDuG0flzcI4n
	dg9kYewpCoVpU+4U+B5D6Xjg44nmhcVRMDzEkTezHILx1eGKL9COSCmpcZGI2XYAEqdsGy
	bUaRyShXX7NdmSvhMmbaOBNx5hqgTNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-LTSkHE1kPSuA5z2Tj8q68w-1; Thu, 30 May 2024 12:09:41 -0400
X-MC-Unique: LTSkHE1kPSuA5z2Tj8q68w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4211239ed3dso1563435e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 09:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717085380; x=1717690180;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmAWYa3Wn5pwGCJRKhtYAwe8ICl8pqH0+HJasGP6qig=;
        b=LBkVXPgpfgyGfJLfYw4ttB0TzfgMYB4SK4xYyJBNFKWgqinrp6EksryaZNYvupiMpr
         czjI/lMmYnqbwaoXIGBxe2nzcfmG0cP2aY//mq7SuKjJqFmkeZUlPrqsPayELXL43Pra
         q4/bJlOEfsTX/+4kr7vCeYKVisYhUurmwfPo8oOhoYp9ObIPxNO2etNkT3+cdjhOnikU
         MZq1Y5jwXHI6nFd02DVbBCU3ixpqU4ic+2sjqjhbDWkDxeAnbZJKoNWcxHTO5GZEcU/9
         enwF6X57pSMuPHk+Gfz2jxnCl7FdAxMaPNlCa9okAyudfMEGoAKxPMXf+rvdVTlc2eFQ
         q9VA==
X-Gm-Message-State: AOJu0Yxihhf/9iHPOCsbYuuuOCRqgYCtkrwqtV76oG1TBn+naQsjQ3TA
	snRS4xBXcRLc+DS5Cnz7uBe+FmaDvXje7oZt3NayQcaqAu1BN5EJPhxPAD6/NHjycEje7S6j5W7
	feE8Xqo74GWCHYVe06CWucitcNOdUs84C88prg3QLntALhU0tYDlXdJKAQMwtBura
X-Received: by 2002:adf:e741:0:b0:354:d14a:cb60 with SMTP id ffacd0b85a97d-35dc02b707fmr1882604f8f.7.1717085380180;
        Thu, 30 May 2024 09:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKVeC/YLPZnADn4gKm8ovYgw+kFGTc619g0i+NtLcSgXlT7O5jPL6t3Uwq+cWjZ4+xCaMskQ==
X-Received: by 2002:adf:e741:0:b0:354:d14a:cb60 with SMTP id ffacd0b85a97d-35dc02b707fmr1882587f8f.7.1717085379718;
        Thu, 30 May 2024 09:09:39 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0908c7sm17699426f8f.51.2024.05.30.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:09:39 -0700 (PDT)
Message-ID: <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 30 May 2024 18:09:30 +0200
In-Reply-To: <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
	 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-05-30 at 11:08 -0400, Willem de Bruijn wrote:
> On Sun, May 26, 2024 at 11:26=E2=80=AFPM Jason Wang <jasowang@redhat.com>=
 wrote:
> >=20
> > On Thu, May 23, 2024 at 4:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
>=20
> Sorry, late to this proposal. Originally introduced in 2022?

Let's say that it went into idle status for long time;)

> > > On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> > > > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO o=
ver
> > > > UDP tunnel. It can be negotiated on both the host and guest sides.
> > > >=20
> > > > UDP tunnel usage is ubiquitous in container deployment, and the abi=
lity
> > > > to offload UDP encapsulated GSO traffic impacts greatly the perform=
ances
> > > > and the CPU utilization of such use cases.
> > > >=20
> > > > One constraint addressed here is that the virtio side (either devic=
e or
> > > > driver) receiving a UDP tunneled GSO packet must be able to reconst=
ruct
> > > > completely the inner and outer headers offset - to allow for later =
GSO.
> > > >=20
> > > > To accommodate such need, new optional fields are introduced in the
> > > > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offse=
t,
> > > > inner_nh_offset. They map directly to the corresponding header
> > > > information.
> > > >=20
> > > > Note that the inner transport header is implied by the (inner) chec=
ksum
> > > > offload, if present. Otherwise, it's up to the receiver to detect t=
he
>=20
> Can we just require filling checksum start and checksum off for tunnel
> types. Even if the checksum offload flag is not set.

I think it should work.=20


> > > > inner transport header offset from the provided information, as it'=
s
> > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > >=20
> > > > The outer UDP header may carry a second checksum, which can be offl=
oaded
> > > > independently from the inner one. Since UDP tunnel checksum offload
>=20
> Just require local checksum offload? Computing the outer checksum is
> always cheap.=C2=A0Optional double checksum offload might add complexity
> that is not needed, as it is so cheap.

The rationale behind the making the outer csum offload manadatory was
to keep the specification change simple and prevent the exhaustion of
the virtio_net_hdr flags and gso_type exhaustion. With this change,
'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' has 3
5 bits used and will raise to 6 (even if only 3 of them will be
bitfields).

The complexity problem is only relevant for h/w implementation, right?
Is really such a problem for modern H/W?

> > > > support makes little sense without UDP tunnel GSO support, to avoid
> > > > unnecessary complex feature negotiation, the
> > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the o=
uter
> > > > header checksum offload and the checksum itself is handled similarl=
y to
> > > > the inner header one.
> > > >=20
> > > > Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike ot=
her
> > > > types of GSO offload: VMs that has negotiated such features could b=
e
> > > > migrated only on hosts supporting such features.
> > > >=20
> > > > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > > > vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> > > > - given the information carried by the guest or host kernel, it's
> > > >   impossible to probe reliably the UDP tunnel type. Specifically, t=
he
> > > >   outer UDP port numbers give a hint, but peers could use nonstanda=
rd
> > > >   ones.
> > > > - all the existing UDP tunnel protocols behave the same way WRT GSO
> > > >   offload, carrying an immutable header on top of the outer transpo=
rt
> > > >   one.
> > > > - if a new UDP tunnel protocol, carring packet dependant informatio=
n
> > > >   alike the inner packet length or csum should surface in the futur=
e,
> > > >   the host and guest kernels will need explicit support for it,
> > > >   including new, different GSO features. Additional virtio support
> > > >   should be designed separately.
> > > >=20
> > > > Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>=20
> Can you reconsider the choice to only allow UDP encap that includes an
> inner MAC header?
>=20
> There are useful UDP based tunnels that skip that, such as GUE. Virtio
> revisions are a long process. If we can accommodate those in the
> design from the start, that saves us much work later. Or, at minimum
> make sure that the proposed design can easily be extended to such
> protocols.

I'm surprised about interest in GUE: for years I wondered about
deprecating and removing it (together with FOU).

Yes, I think the ethernet-only constraint could be removed, but I fear
that will pose some difficulties for H/W implementation - requiring
extra flexibility - and possibly some additional features negotiation
should be needed.=20

I think that the struct layout can already cope with GUE or the like.

>=20
Cheers,

Paolo

