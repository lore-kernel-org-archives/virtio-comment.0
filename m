Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA817B51A
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018835; cv=none; b=bpRh7Vfy4UH6BOa17EaTapGbfuX5AwCaMgiiL78LiiIfBlalOH2r8cjs47fHEy7hvRT1NvYrjt2I4+Z/fDO22cp5y0SJOtcPhlgnk3Dlj4MqOV2c73zXNOgt/SCqhSJt9qw3xvFeB871ET8xTKbADU9Iusfpbm+Y4O6d16Mg+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018835; c=relaxed/simple;
	bh=eV1aP2sMVjLMcBHXGc/49VFU1ELpWI3oRArsdsHn+94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cogw7qDBBLiWbiD6DyBrsvLdqgZmcIrnE863cUH6d3w+6z9eUKNUBMKaJUr6xtyBa8QvqJ943Im4agtOhnTtSsj1IVM40qkOqvw3KBKfdsY+MWxIuDtgbNlp8IuhOdGBVnS/2QZBP7GFD7dRztB7Q8mptOBXoQirb6saDM7jyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bq+fjkw+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bq+fjkw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720018832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IacB+/sLiCHZTgxIuP7BzEPhik9cIpmKMtsA63T5Roo=;
	b=Bq+fjkw+vfH7e6XVdN2W3mU2JQLHm1BD5y/JLmRcdqYGgvgn5Paxbofqt9nDYM4/Jt9zpU
	Id5YgtaZ0udiXMaf0xuXMCRMQq5Tyg1ZbySEY9odr9yU2EnlP+dpSqlHY8AIfW5SjH0ZG7
	niC64A7Zjh00Skpn7dmXJiP1maIqfAM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-a1jz-DtFOJqG_qBbk5lcxw-1; Wed, 03 Jul 2024 11:00:30 -0400
X-MC-Unique: a1jz-DtFOJqG_qBbk5lcxw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36794e8929bso151205f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 08:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018829; x=1720623629;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IacB+/sLiCHZTgxIuP7BzEPhik9cIpmKMtsA63T5Roo=;
        b=w7XoWG9Q+LQ+1s0gkXshn+0pGptMoR0aG6c0G3SuIA7nVwkE1VGFkEmyxF4MhTUuNB
         wotT+iEn6iTlUdfy+nkAcXpO6gtKQNamQAKGv2ozlb1aslD70a11AGLpFtguW55c/qDa
         ZJ7xIrdsM1U1MbnM7ATte80cHcpN9EOGXYzwmRlAxl72HgMoDtmsmZprakxt95QkXjIF
         LLyaSXcJ3Z8R9XoGZdX82LsyYlMYAGkiX0r9ybdLTxFVszIicF+mXot9C9aHQzQkr7UY
         t/mec4Zr7GUZ7ZEC4wEYRJgqV9z072khWArMnBgyzY5fvwRif4SMocY93TW8H4kY0nHe
         qxHg==
X-Forwarded-Encrypted: i=1; AJvYcCU6SfKqyAGnbEUu/36s4EI3r4fm7ExA3j31Hqo31MhMtBwg4LAkKxgXDSytYPMWo8NnRYNzK7akmFkuJaItNoWIPJYVmcmU3dUmpp0J5J4=
X-Gm-Message-State: AOJu0YwJ1Y4n92dWwLsAnSw7JIwYWzZrkCxcJvoyF2F6V3azM+RGIfB0
	ZruSx7yJSiq+eIYkLh+iF2T/vowCaV8xQo4wkDbMNuSlO+fhU2jW7otkicUmMOj0TV3edP7IDhX
	cZP0iZQI49GPTmT7tPFjvuRKeQ+H2LYkiJSfOgIwA9UpITU1O/cxCedDUfb6ZGoMQ
X-Received: by 2002:a05:6000:178f:b0:366:e4b4:c055 with SMTP id ffacd0b85a97d-367757384bamr8919578f8f.7.1720018829259;
        Wed, 03 Jul 2024 08:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2EccBsX/Y1UP4pQhqpLWtflSCHyi3vpQzVst5Asycz51kUGDu5M1h0gb05CM2LK8evF9Kxg==
X-Received: by 2002:a05:6000:178f:b0:366:e4b4:c055 with SMTP id ffacd0b85a97d-367757384bamr8919548f8f.7.1720018828849;
        Wed, 03 Jul 2024 08:00:28 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:172b:1510::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1108b0sm16051736f8f.114.2024.07.03.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:00:28 -0700 (PDT)
Message-ID: <3dd4b01fbc53bcd4e42a5ac8ea6445b91cc2d50b.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Date: Wed, 03 Jul 2024 17:00:26 +0200
In-Reply-To: <CA+FuTSfsAuj0PLSoezWAP=ZREhNp4KR7VcBFbc+7hL7wBeZ5Sw@mail.gmail.com>
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
	 <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com>
	 <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
	 <CA+FuTSfsAuj0PLSoezWAP=ZREhNp4KR7VcBFbc+7hL7wBeZ5Sw@mail.gmail.com>
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

On Tue, 2024-07-02 at 19:43 -0400, Willem de Bruijn wrote:
> On Tue, Jul 2, 2024 at 12:38=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
>=20
> > Additionally, I raise a doubt about PISO
> > feasibility in the virtio net case.
> >=20
> > Let suppose virtio support PISO, the device transmits an UDP tunnel GSO
> > packet, the driver receives it and fill the skbuff. The inner protocol
> > and mac are unknown. Even skb->encapsulation is left zeroed. When/if
> > such packet is later S/W segmented bad thing will happen.
>=20
> I think these could be addressed with the right virtio_net_hdr fields.

(Almost philosophical question) If we add more field beyond the outer
header offset, is that still PISO? Or just ~ this proposal?

> But it's fine to skip too.
>=20
> >=20
> > Note that even without PISO support it should be easy to expose GSO
> > PARTIAL support on top of virtio_net, even for packets requiring outer
> > checksum offload.
>=20
> I guess by virtue of
>=20
> The packet will get SKB_GSO_UDP_TUNNEL_CSUM | SKB_GSO_TCPV4.
>=20
> The physical device advertises
>     features =3D NETIF_F_TSO
>     gso_partial_features =3D NETIF_F_GSO_UDP_TUNNEL_CSUM
>=20
> And so the virtio device will send it to software segmentation to
> create the partial gso pair of packets?

Exactly.

Thanks,

Paolo

