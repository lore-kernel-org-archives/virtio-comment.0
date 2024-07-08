Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDE78C71
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720435098; cv=none; b=pRKJtLDSyRhS1I5hO5dCjtKMAN5TlethZUE2th9uUvjj5cY1Wr1VS6k0oJ2GHoaSMtQv4jiz8Zo4rQlDUhgsS1Ux7Ku5ce0rAtxu/iS0Rp955drAbDvFeJymHj/xdd+aqsPC5ONYdrIsjnjIQI+BLx9dxZiJmn3iLDOj92WZcfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720435098; c=relaxed/simple;
	bh=eoAVBZAsHg0t3CnyQTx3592h0XSlr3BIw3DiWHvHQ8o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E4MlumzISHmMSn1jTuQ4EMTey1UIhUufkBU/CEQUlR3O6LcpBoLHnpbsjz1anFfSo9T6YZwtgXy+Q9a+Odh1CNUlrQW5RAg6w9F94evDFat6Y0+SRRCx6BAU+YOJPGSWnlSNTjvMm3doXVkuJBG1K3x0FgHALSHlONCFgp0Sg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TXeWFtFX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TXeWFtFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720435095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eoAVBZAsHg0t3CnyQTx3592h0XSlr3BIw3DiWHvHQ8o=;
	b=TXeWFtFXE7fRfKgB6x/vYswrBLLZm35pwGXV+LwRsrl1QWsJ90+2GpGAIODv9abILlAsQG
	dekS5HOp26UuC/egs7wY63NjIAUISdV3W3AM/CBmN+Xm0u8ucDjDP5smGCX7BEsEIVkR4I
	4oIdNLQe3UEUEVs+GSmKKnFDjad5pho=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-Jb_fLqWuOn2_sFOw_0ilfQ-1; Mon, 08 Jul 2024 06:38:13 -0400
X-MC-Unique: Jb_fLqWuOn2_sFOw_0ilfQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ee9d3b64a8so3183481fa.1
        for <virtio-comment@lists.linux.dev>; Mon, 08 Jul 2024 03:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720435092; x=1721039892;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoAVBZAsHg0t3CnyQTx3592h0XSlr3BIw3DiWHvHQ8o=;
        b=mCuzGMhMEe8FH7eJyXpPexLpF23oLxghQ4Z4rRWagEAZQzyLVY9mj/e9/DA5Scjk9M
         zDY8NOSgykN3EuwwkYdQXYlHB1HxtChF8P1CceYTkuYuuZv1GOgqMirXdptRPwLMIml8
         vZH5vjk4yO4aMCeIZ5iG4U8z2FVHR6IJpvr19q2pJjQ0ZNMbtroj41DIYeGujwZWbINQ
         4CNqSQIM9wglpreV2Kj6v7wrdrYBKaJXFfZjBGOlQIG3NbtD0cz/EOi/QvPcFY/8UGsY
         DYVXZ7rDQHqAkl8Z1ba9jCxeykbCbc2BE9/m78+466gbcxNQe1TZj01sJQkVogYlLAzf
         jNEA==
X-Forwarded-Encrypted: i=1; AJvYcCXB2VZ/9QZxc8XdCa4QSFtFGiJlXpmREeE/hyjBaSbvEVYlNwKazSy1UJoQpkcxp5br24nZ/3yS6mBVRxdMi2DA5/xa1l/KhDdN9fnqyNs=
X-Gm-Message-State: AOJu0YxLgYTGjSdZi0C41Ww/l6lFJfg3txiH759+r/47ejXSoVX7HcU8
	vEUcdNmd9u0qDeCbcDzaWqmLxyBeYOfkpx86REeO1lUdndI5LgdIHq1HUnxmCGACa0oIggto9KX
	lfki6kagEf8N+Uw/s2s9sL9BxIIIZW6BD87Ln3qM1w/5DwSWI+3RtypZQvblSadh0
X-Received: by 2002:a05:651c:10d2:b0:2ee:8915:b532 with SMTP id 38308e7fff4ca-2ee8ee2a672mr67662441fa.3.1720435091974;
        Mon, 08 Jul 2024 03:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWG2wX2FY4tfRVmnxZI6bSYIq8wfbpCMwjKM3HTc3ZNsd9nRjMC5bbTRGU4VVJxXOofknDlA==
X-Received: by 2002:a05:651c:10d2:b0:2ee:8915:b532 with SMTP id 38308e7fff4ca-2ee8ee2a672mr67662291fa.3.1720435091557;
        Mon, 08 Jul 2024 03:38:11 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1710:e810:1180:8096:5705:abe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5casm161360695e9.32.2024.07.08.03.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:38:11 -0700 (PDT)
Message-ID: <4d31f892a481b9d16ec81251b0bd569ba709f4d3.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>, Parav
 Pandit <parav@nvidia.com>
Date: Mon, 08 Jul 2024 12:38:09 +0200
In-Reply-To: <CACGkMEvn8_uJewGw=RNg0133a68KFeoi2ctk2-vxZk=x8z8anQ@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
	 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
	 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
	 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
	 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
	 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
	 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
	 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
	 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
	 <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
	 <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com>
	 <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
	 <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com>
	 <a1a7625f669d58f17e047adee64e050f438d9fbb.camel@redhat.com>
	 <CACGkMEvn8_uJewGw=RNg0133a68KFeoi2ctk2-vxZk=x8z8anQ@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=mQINBGISiDUBEAC5uMdJicjm3ZlWQJG4u2EU1EhWUSx8IZLUTmEE8zmjPJFSYDcjtfGcbzLPb63BvX7FADmTOkO7gwtDgm501XnQaZgBUnCOUT8qv5MkKsFH20h1XJyqjPeGM55YFAXc+a4WD0YyO5M0+KhDeRLoildeRna1ey944VlZ6Inf67zMYw9vfE5XozBtytFIrRyGEWkQwkjaYhr1cGM8ia24QQVQid3P7SPkR78kJmrT32sGk+TdR4YnZzBvVaojX4AroZrrAQVdOLQWR+w4w1mONfJvahNdjq73tKv51nIpu4SAC1Zmnm3x4u9r22mbMDr0uWqDqwhsvkanYmn4umDKc1ZkBnDIbbumd40x9CKgG6ogVlLYeJa9WyfVMOHDF6f0wRjFjxVoPO6p/ZDkuEa67KCpJnXNYipLJ3MYhdKWBZw0xc3LKiKc+nMfQlo76T/qHMDfRMaMhk+L8gWc3ZlRQFG0/Pd1pdQEiRuvfM5DUXDo/YOZLV0NfRFU9SmtIPhbdm9cV8Hf8mUwubihiJB/9zPvVq8xfiVbdT0sPzBtxW0fXwrbFxYAOFvT0UC2MjlIsukjmXOUJtdZqBE3v3Jf7VnjNVj9P58+MOx9iYo8jl3fNd7biyQWdPDfYk9ncK8km4skfZQIoUVqrWqGDJjHO1W9CQLAxkfOeHrmG29PK9tHIwARAQABtB9QYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+iQJSBBMBCAA8FiEEg1AjqC77wbdLX2LbKSR5jcyPE6QFAmISiDUCGwMFCwkIBwIDIgIBBhUKCQgLAgQWAgMBAh4HAheAAAoJECkkeY3MjxOkJSYQAJcc6MTsuFxYdYZkeWjW//zbD3ApRHzpNlHLVSuJqHr9/aDS+tyszgS8jj9MiqALzgq4iZbg
 7ZxN9ZsDL38qVIuFkSpgMZCiUHdxBC11J8nbBSLlpnc924UAyr5XrGA99 6Wl5I4Km3128GY6iAkH54pZpOmpoUyBjcxbJWHstzmvyiXrjA2sMzYjt3Xkqp0cJfIEekOi75wnNPofEEJg28XPcFrpkMUFFvB4Aqrdc2yyR8Y36rbw18sIX3dJdomIP3dL7LoJi9mfUKOnr86Z0xltgcLPGYoCiUZMlXyWgB2IPmmcMP2jLJrusICjZxLYJJLofEjznAJSUEwB/3rlvFrSYvkKkVmfnfro5XEr5nStVTECxfy7RTtltwih85LlZEHP8eJWMUDj3P4Q9CWNgz2pWr1t68QuPHWaA+PrXyasDlcRpRXHZCOcvsKhAaCOG8TzCrutOZ5NxdfXTe3f1jVIEab7lNgr+7HiNVS+UPRzmvBc73DAyToKQBn9kC4jh9HoWyYTepjdcxnio0crmara+/HEyRZDQeOzSexf85I4dwxcdPKXv0fmLtxrN57Ae82bHuRlfeTuDG3x3vl/Bjx4O7Lb+oN2BLTmgpYq7V1WJPUwikZg8M+nvDNcsOoWGbU417PbHHn3N7yS0lLGoCCWyrK1OY0QM4EVsL3TjOfUtCNQYW9sbyBBYmVuaSA8cGFvbG8uYWJlbmlAZ21haWwuY29tPokCUgQTAQgAPBYhBINQI6gu+8G3S19i2ykkeY3MjxOkBQJiEoitAhsDBQsJCAcCAyICAQYVCgkICwIEFgIDAQIeBwIXgAAKCRApJHmNzI8TpBzHD/45pUctaCnhee1vkQnmStAYvHmwrWwIEH1lzDMDCpJQHTUQOOJWDAZOFnE/67bxSS81Wie0OKW2jvg1ylmpBA0gPpnzIExQmfP72cQ1TBoeVColVT6Io35BINn+ymM7c0Bn8RvngSEpr3jBtqvvWXjvtnJ5/HbOVQCg62NC6ewosoKJPWpGXMJ9SKsVIOUHsmoWK60spzeiJoSmAwm3zTJQnM5kRh2q
 iWjoCy8L35zPqR5TV+f5WR5hTVCqmLHSgm1jxwKhPg9L+GfuE4d0SWd84y GeOB3sSxlhWsuTj1K6K3MO9srD9hr0puqjO9sAizd0BJP8ucf/AACfrgmzIqZXCfVS7jJ/M+0ic+j1Si3yY8wYPEi3dvbVC0zsoGj9n1R7B7L9c3g1pZ4L9ui428vnPiMnDN3jh9OsdaXeWLvSvTylYvw9q0DEXVQTv4/OkcoMrfEkfbXbtZ3PRlAiddSZA5BDEkkm6P9KA2YAuooi1OD9d4MW8LFAeEicvHG+TPO6jtKTacdXDRe611EfRwTjBs19HmabSUfFcumL6BlVyceIoSqXFe5jOfGpbBevTZtg4kTSHqymGb6ra6sKs+/9aJiONs5NXY7iacZ55qG3Ib1cpQTps9bQILnqpwL2VTaH9TPGWwMY3Nc2VEc08zsLrXnA/yZKqZ1YzSY9MGXWYLkCDQRiEog1ARAAyXMKL+x1lDvLZVQjSUIVlaWswc0nV5y2EzBdbdZZCP3ysGC+s+n7xtq0o1wOvSvaG9h5q7sYZs+AKbuUbeZPu0bPWKoO02i00yVoSgWnEqDbyNeiSW+vI+VdiXITV83lG6pS+pAoTZlRROkpb5xo0gQ5ZeYok8MrkEmJbsPjdoKUJDBFTwrRnaDOfb+Qx1D22PlAZpdKiNtwbNZWiwEQFm6mHkIVSTUe2zSemoqYX4QQRvbmuMyPIbwbdNWlItukjHsffuPivLF/XsI1gDV67S1cVnQbBgrpFDxN62USwewXkNl+ndwa+15wgJFyq4Sd+RSMTPDzDQPFovyDfA/jxN2SK1Lizam6o+LBmvhIxwZOfdYH8bdYCoSpqcKLJVG3qVcTwbhGJr3kpRcBRz39Ml6iZhJyI3pEoX3bJTlR5Pr1Kjpx13qGydSMos94CIYWAKhegI06aTdvvuiigBwjngo/Rk5S+iEGR5KmTqGyp27o6YxZy6D4NIc6PKUzhIUxfvuHNvfu
 sD2W1U7eyLdm/jCgticGDsRtweytsgCSYfbz0gdgUuL3EBYN3JLbAU+UZpy v/fyD4cHDWaizNy/KmOI6FFjvVh4LRCpGTGDVPHsQXaqvzUybaMb7HSfmBBzZqqfVbq9n5FqPjAgD2lJ0rkzb9XnVXHgr6bmMRlaTlBMAEQEAAYkCNgQYAQgAIBYhBINQI6gu+8G3S19i2ykkeY3MjxOkBQJiEog1AhsMAAoJECkkeY3MjxOkY1YQAKdGjHyIdOWSjM8DPLdGJaPgJdugHZowaoyCxffilMGXqc8axBtmYjUIoXurpl+f+a7S0tQhXjGUt09zKlNXxGcebL5TEPFqgJTHN/77ayLslMTtZVYHE2FiIxkvW48yDjZUlefmphGpfpoXe4nRBNto1mMB9Pb9vR47EjNBZCtWWbwJTIEUwHP2Z5fV9nMx9Zw2BhwrfnODnzI8xRWVqk7/5R+FJvl7s3nY4F+svKGD9QHYmxfd8Gx42PZc/qkeCjUORaOf1fsYyChTtJI4iNm6iWbD9HK5LTMzwl0n0lL7CEsBsCJ97i2swm1DQiY1ZJ95G2Nz5PjNRSiymIw9/neTvUT8VJJhzRl3Nb/EmO/qeahfiG7zTpqSn2dEl+AwbcwQrbAhTPzuHIcoLZYV0xDWzAibUnn7pSrQKja+b8kHD9WF+m7dPlRVY7soqEYXylyCOXr5516upH8vVBmqweCIxXSWqPAhQq8d3hB/Ww2A0H0PBTN1REVw8pRLNApEA7C2nX6RW0XmA53PIQvAP0EAakWsqHoKZ5WdpeOcH9iVlUQhRgemQSkhfNaP9LqR1XKujlTuUTpoyT3xwAzkmSxN1nABoutHEO/N87fpIbpbZaIdinF7b9srwUvDOKsywfs5HMiUZhLKoZzCcU/AEFjQsPTATACGsWf3JYPnWxL9
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

On Mon, 2024-07-08 at 10:11 +0800, Jason Wang wrote:
> On Fri, Jul 5, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
> >=20
> > On Fri, 2024-07-05 at 11:26 +0800, Jason Wang wrote:
> > > On Thu, Jul 4, 2024 at 12:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> > >=20
> > > > Anyway if a device can't perform H/W GRO it will send to the driver=
 non
> > > > GSO packet. It will not need to fill any fields for that.
> > > >=20
> > > > Let's suppose we have to host with H/W virtio net support, both
> > > > exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, host2
> > > > can't. I don't see migration issues between host1 and host2. The la=
tter
> > > > will not generate any UDP TUNNEL GSO packet for geneve, but will se=
nd
> > > > to the driver plain packets, as on the wire.
> > > >=20
> > > > What I'm missing?
> > >=20
> > > Probably not but not sure if this is a actual bug, but consider:
> > >=20
> > > Guests can only know inner protocol X and Y. So did host 1. But after
> > > migrating to host2, it can have inner protocol Z. Can this happen or
> > > not?
> >=20
> > As mentioned, the guest will not parse the packet, it just need to
> > validate the fields.
> >=20
> > Yes, the above scenario can happen, but AFAICS it will not cause any
> > bugs.
> >=20
> > The guest will be able to process and segment the UDP tunnel GSO
> > packets with unknown UDP tunnel protocol thanks to the mentioned
> > additional fields added to the virtio net header.
> >=20
> > Obviously, if the guest don't understand geneve packets, and the host
> > suddenly starts sending them, at some point such packets will be
> > dropped inside the guest.
>=20
> Ok, I meant for example, guests don't understand UDP GSO geneve
> packets but can understand non GSO geneve packets.

I guess there some ambiguity with using the term "understand".=20
What do you mean with "guests don't understand UDP GSO geneve packets"?

Given the additional virtio net header fields, the guest will be always
able to segment any UDP tunneled GSO packet, comprising any possibly
geneve packet layout.

> > > >=20
> > > And still something needs to be considered:
> > >=20
> > > 1) inner nh/mac/protocol seems to be meaningless for hardware
> > > virtio-net implementation, anything we can optimize on this? (maybe
> > > not since e.g num_buffers is meaningless for TX as well)
> >=20
> > Do you mean in the Host2VM direction? They are needed to the VM, to
> > fully understand/build the GSO packet.
> >=20
> > Or do you mean in the the VM2Host direction? The device will need them
> > to do H/W segmentation of the packet.
>=20
> I meant for example bare metal usage, host is using virtio-net NIC. If
> the NIC can't do VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO, could we avoid
> those inner headers?

I see. The current specification change makes the new fields mandatory=20
if the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature or
VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature are negotiated.

In a previous message I proposed to include such fields only when the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in the gso_type field. That
should both address the above concern and optimize the binary layout in
the general case. Are you ok with such proposal?

> > > 2) do we need to hear from hardware vendors to see if there's a chanc=
e
> > > to implement RX UDP Tunnel?
> >=20
> > The bnxt driver proves it's feasible. The lack of other NICs with such
> > support hints it's difficult and/or there are is no large demand for
> > that (I wild guess the latter).
> >=20
> > Possibly we can make the life easier for H/W driver implementations
> > adding a configuration command -say VIRTIO_NET_CTRL_UDP_TUNNEL_CONFIG -
> > and allow the guest to explicitly request/enable specific UDP tunnel
> > types?
>=20
> Probably but then we need to deal with compatibility issues. E.g src
> support tunnel X but dst doesn't.

Existing NICs need to explicitly enable e.g. geneve or vxlan offload. I
mentioned the above configuration command as a way to hook into such
NIC-related configuration steps.=C2=A0

A simpler alternative could to be let the virtio net H/W implementation
always enable all the supported UDP tunneled GSO offload when the
VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO is negotiated

> > Somewhat related question: what happens after a migration to the
> > configuration send by the driver to the device? is up the the VM
> > somehow catch the migration event and re-send them?
>=20
> I think not, when command X succeeds in the source, the guest will
> assume it will succeed in the destination.
>=20
> > Or after the
> > migration the VM is expected to run on top of a driver with a different
> > configuration?
>=20
> Nope, migration is totally transparent to the guest.

Perhaps an example will help clarifying.

Let's suppose a guest configures VIRTIO_NET_HASH_TUNNEL_TYPE_VXLAN and
VIRTIO_NET_HASH_TUNNEL_TYPE_GENEVE on the current host and later is
migrated elsewhere. Will the guest will stop receiving packets with
hash_report carrying such values? if not, why/how?

Thanks,

Paolo

