Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356318C11
	for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 03:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730086063; cv=none; b=eH/cOJKJg6G1CWg8o3Dk/mLY6I7Lx3rnwZdvRLQL6TN5YwOq3yLDCwOZiESIZyqKlVVwQ+4KEZPf61F2dyJB1rJt+8qWgT6QuycsP02NPh9a0iT5Xw7uOkPXyXQhQBRVDtzxF5f/BFpVu7xhrQyhJ/qPnVGUhNRkwr8hLzY5EoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730086063; c=relaxed/simple;
	bh=O0/XS13HxTidViY7zX2nM2vzHR7tfIMIBk91EogQNho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHE5CVrJpyFhHZS5fu6IMvcJooqrVjt/rL/TkwMRg30j2rTSnJ/e3f3RdF3ug5OexAnJtshE3U6j/CSMAl/fdcJDAZ3D4C6QZ9HqbRa4Pu0OyQm369nKYhhIImGjrpSi4PzOx0IihWAQ1Tmih0HcLB/fc8I/9+SpRd2o9KtVaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NslDwXfa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NslDwXfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730086059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cA2/urgF1UpS+gwUzQGD+Bkl4oh6K8MjpMZH1053C7c=;
	b=NslDwXfawQINWkYdHt6Iv6kTFJBd/G9qGU6PXIITvCjZiOb2ZcwBE6P2AvgBVad95PH0x/
	0Ubvvd4sCnuSjYOFGTrXemAFsxpF/X2T+3cpN3r/176EhXwUx3zl9s66jkLxx0dCw+O/Y/
	iN1QNnuB0pwoZf6Q0lATfPfbrFEVPyM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Hg2zX1xuN2mpyu17HLv8KA-1; Sun, 27 Oct 2024 23:27:37 -0400
X-MC-Unique: Hg2zX1xuN2mpyu17HLv8KA-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7202dfaa53fso5594324b3a.0
        for <virtio-comment@lists.linux.dev>; Sun, 27 Oct 2024 20:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730086056; x=1730690856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA2/urgF1UpS+gwUzQGD+Bkl4oh6K8MjpMZH1053C7c=;
        b=H+qaLkalbpdKsaYH5vmIiX0vjS+wDCtX4lxaPGPLPssLZoZL0SjzDcovga7EH7uAoL
         2bQ5dYcYJQPC6XaoG95Zzqq96Z9JyJkvQJD2nwUHhjOv1YEXxCf8ziTnWBzyb+FxmcH/
         LuIzMI8oF431KhaUH8rFg2MItQzK0T0ZrCSgf59cGeg0JO3GT4/8Q4NuZUYghXME5r+A
         pWqh46cjCG3x2x69B3HR1eoDU07I+pkysHbx8cx8BBSV1gFV7IkI42MLNH16vsPNNzq8
         WuAmdnUTHgwzBb9n6PhrW0tJn65qyDnsnWlFGyJgUqIxbaTOHEuL2P0CfAvO/A2X3YUq
         Tpsg==
X-Gm-Message-State: AOJu0YzpN42fyDF4mWjF11FXX+EXoG8qMF3pk17ipuJGkepaX7tBoNNi
	sIWk+MOFjUvS7RRG/WV9rCP3Ju1UgcLuIXTDAaYdxluC4s7JaUAJFzmSRo+2BQyuC1lTBhvxaY1
	fa8RjNMGzN12YLl4fePsEyBF9bZ4rEQjE7R+P/Q5DZyT+m6oF1rzExQNKdXGUuDiGODFb8nDePF
	WoQ3cIajei0+dRY0Rt+GONhpSSFzFb9zv5OmORWNo=
X-Received: by 2002:a05:6a00:3908:b0:71e:6f4d:1fa4 with SMTP id d2e1a72fcca58-72062fb830emr9906073b3a.10.1730086056292;
        Sun, 27 Oct 2024 20:27:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP1NVoK6PCrfrG2FkvD23C/RNktn9JVivqZnbf2mC7J7Dy0Fl7lCGnfzBGixPgAZWfPZml38Zr9XRdwJ7qfjc=
X-Received: by 2002:a05:6a00:3908:b0:71e:6f4d:1fa4 with SMTP id
 d2e1a72fcca58-72062fb830emr9906047b3a.10.1730086055769; Sun, 27 Oct 2024
 20:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com> <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com> <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
In-Reply-To: <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Oct 2024 11:27:24 +0800
Message-ID: <CACGkMEs4xb=xEH2RwQYZFEP9WGdwT2jOSERmpzTto+PQuxgcwg@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 7:51=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/25/24 10:28, Jason Wang wrote:
> > On Wed, Oct 23, 2024 at 12:56=E2=80=AFAM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >> I proposed the following:
> >>
> >> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
> >> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
> >>
> >> That means that the device supports csum offload for both the inner an=
d
> >> the outer and both csums are valid. The corresponding skb will have
> >> CHECKSUM_UNNECESSARY and csum_level =3D=3D 1.
> >
> > Nit: csum_level seems to be Linux specific.
>
> Note: the above was an informal description of the proposal, not the
> actual wording to be used in the spec.

I see.

>
> >> There is actually another point which I'm quite scared to mention
> >> because it caused v9 and implicitly all this discussion.
> >>
> >> I want to prevent the driver receiving from the device GSO over UDP
> >> tunnel packets without csum_start/csum_offset, because the header
> >> probing code looks fragile and bug-prone and will be even more complex
> >> in case of tunnels.
> >
> > This needs more thought. For example, it seems not specific to GSO.
> > Should we have a new feature for this? (And build a GSO UDP tunnel on
> > top?)
>
> Double checking I read the above correctly.
>
> Do you mean something alike the following to negotiated another feature
> controlling a new bit in flag telling 'the csum_start field is set even
> if NEEDS_CSUM is not set'?

Just wondering if it's worth it.

>
> What about using the flag already defined in patch 2 instead (currently
> named VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM, possibly a different better name
> can be used [suggestion more than welcome])?

If we want to make a csum_start/offset set for DATA_VALID, I think we
need a dedicated feature flag along with the new vnet header flag.

>
> The overall schema will be:
>
> - DATA_VALID retains its current semantic when GSO over UDP features are
> not negotiated and when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set

Just to make sure we are aligned, it looks like we go with this way.
The new flag only makes sense for GSO UDP tunnel, then it seems
unnecessary for a dedicated feature.

I think we need to know if it makes sense to mandate csum_start/offset
for non GSO UDP tunnels.

Going back to what you points out in the above (I think we had some
discussion but without conclusion):

"
I want to prevent the driver receiving from the device GSO over UDP
tunnel packets without csum_start/csum_offset, because the header
probing code looks fragile and bug-prone and will be even more complex
in case of tunnels.
"

I want to know which case for such a requirement can help. Or you
mean, e.g for RX side:

1) csum_start/offset is not set: driver need to probe the header which
2) csum_start/offset is set: driver need to do something simpler than 1)

If 2) is true, it seems to relax the check somehow anyway which seems
not optimal. And requiring csum_start/offset doesn't help for
fragility of the driver codes.

>
> - when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set that means the following:
>   - 2 checksums are offloaded - the 2 outer-most one in case the packet
> carries more nested headers.
>   and
>   - 'csum_start' points to the innermost offloaded header

I'm not sure I will get here, so if we had 3 checksums of 2 levels of
tunnel, the above seems to be a conflict:

1) outermost and level 1 tunnel is offload
2) csum start points to level 2 tunnel

>
> - DATA_VALID can be set together with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM,
>   meaning:
>   - CHECKSUM_UNNECESSARY with csum_level =3D=3D 1,
>   and
>   - csum_start -> inner transport offset. If the packet carries many
> nested headers csum_start points to the 2nd outermost one.

So it depends on the driver to check the rest of the inner level. It
looks anyhow inconsistent with the above. And if we do LCO, at least
TX sider csum_start needs to point to the innermost one, this looks
like another inconsistency.

>
> - VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} can be set/used if and only if:
>   - NEEDS_CSUM is set (csum_start/csum_offset avail)
>     or

As explained before, I think it's better to stick to the semantics
that map to CHECKSUM_PARTIAL which seems mutually exclusive with
CHECK_UNNECESSARY.

>   - DATA_VALID and VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM are both set
>     (meaning 2 csums are offloaded and csum_start is avail)
>
> Note that even the following will be also allowed:
>
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} is set, NEEDS_CSUM is set,
> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set.
>
> meaning it's GSO over UDP tunnel packets, with both checksum offloaded
> and CSUM_PARTIAL.
>
> WDYT?

As the topic becomes more complicated, I wonder if we can do something
easier, that is focusing on the one checksum offload first. And I
would like to check the current Linux behaviour first for non-GSO UDP
tunnel:

1) For TX, as you've mentioned, the csum_start/offset has already
pointed to the inner header (but is this the innermost?)
2) For RX, what header would csum_start/offset points (considering we
have nested tunnels)

I'm asking to make sure our proposal doesn't conflict with the
existing implementation.

Thanks

>
> Thanks,
>
> Paolo
>

