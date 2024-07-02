Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED41BC094
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938322; cv=none; b=Y52XWbv9BLCgzhbJM2Bn5a//IFpSPqWa57CGmX3dCfymyEItmxtLQw9nLByzkL0DCtzvHa6gd7Fasir4pPQfgiC885gBs1nzw6a8oh31OGXr9bro/1z/XBfhTM8zdJbNyi13ayxvTSWdmA+sMBbKz8GSM5VseS4yMjlBz+fAldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938322; c=relaxed/simple;
	bh=HTJls0UQdhvaXm60HfNThfvztj4GJdRoNMOP5waN1rI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQTYR1sE8HZIOqSuQlHglhkez64AW1/8kz38hGrpRzJeXzwVeM1l1iVKZ335LIvYxrZzy08QUML2wXfCe8FbH6bIjg67A7DPAH1gXZrtaSCgffCcndyNrmrJa6ElyA8LUe7+MbOkZ1kLNo/TaYG/138zmA1me6FH92Tm45V5CAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9FY0vCz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9FY0vCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719938320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HTJls0UQdhvaXm60HfNThfvztj4GJdRoNMOP5waN1rI=;
	b=C9FY0vCzyctnnaBj8VFM6YHmxtm45gY9hpykJaATbRCxVthCdZV7IPan7pFye1YJa/6CUr
	KpJq45Sj5T7ep63XtnqmcS+IOW5O8xLFhS2mHZ8XY67rkbfLGbaI1/ApLEikD95pLstwqu
	Zs73aLA05DO6oWJ1EYdeRtb18crZHTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-s5k2t6iPNIOweHzFszqiJQ-1; Tue, 02 Jul 2024 12:38:38 -0400
X-MC-Unique: s5k2t6iPNIOweHzFszqiJQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4257784c759so6216395e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 09:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719938317; x=1720543117;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTJls0UQdhvaXm60HfNThfvztj4GJdRoNMOP5waN1rI=;
        b=tyn17tr8fQ7ktMWdTWdRoZ2/Pf2tcBJVPHSQ7N5CI/89N+QplidIYarcCeExMCHMma
         6JkEezgEIprcDrH5brSx5gGk4e02e5jz4SFhYbi/vjvAasn9VpcG/5qo7zfFz21y9lB/
         WUP2jhBs7cUTCzu2o2s+lm5AOgc9wvPGJOcu3ij7VG9kuI6G7PDtlDGKO5EWJEgzNC6U
         KB4W+g5nF2K1mbhCkVLtfxyAzsKM1z0IMU9IDtBfBq03KdZaGuojn1sMBTUoZqaYWE2e
         fMFjRUMfwSjvWpXHyykCXSdn8AKOt4ckCcwL0e6y+gEuHRTfC3dKflAMJpthvj7Y+ls/
         3lpg==
X-Gm-Message-State: AOJu0YxP+hmZKc1NljzR0Dgbjsqo16XOVvi5h7gxhAkyp21Y+lBGsKZS
	jHabJcJOIj6xJosE8mV+W0nHDpPo9DtgkQ2aqOlYxo+YHLAc3pRsGU27jvuG+Nr28trlUwQMWhO
	zrAtKNMP65qv8Rcma3l72qQoQWdLn28DNAIjacwTsLMtvpn2eOjE68AdDeBIurwkL
X-Received: by 2002:a05:600c:3b05:b0:425:69cb:548b with SMTP id 5b1f17b1804b1-4257a15ac67mr64108445e9.4.1719938317767;
        Tue, 02 Jul 2024 09:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvnou1km7bL3S+/L3Qztu7XFDyDzfGkZwfnODInJLDRalM1cZ573lL88Nu67WN7JvKuFcloQ==
X-Received: by 2002:a05:600c:3b05:b0:425:69cb:548b with SMTP id 5b1f17b1804b1-4257a15ac67mr64108305e9.4.1719938317374;
        Tue, 02 Jul 2024 09:38:37 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0a6:6710::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030c8sm13675413f8f.98.2024.07.02.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:38:36 -0700 (PDT)
Message-ID: <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Date: Tue, 02 Jul 2024 18:38:35 +0200
In-Reply-To: <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com>
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

On Tue, 2024-07-02 at 08:46 -0400, Willem de Bruijn wrote:
>=20
> > VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
> > probe them. For example, Linux driver has this in
> > virtio_net_hdr_to_skb():
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/* gso packets without NEEDS_CSUM do not set tra=
nsport_offset.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* probe and drop if does not match one of =
the above types.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (gso_type && skb->network_header) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
struct flow_keys_basic keys;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
...
>=20
> One of my main interests here is to ensure that we avoid
> introducing more such permissive combinations of flags
> that no real application uses, but syzbot exploits.

As mentioned in my previous email, the current proposal does not
specify it, but UDP tunnel GSO could mandate (inner) csum offload as a
pre-req, avoiding a few edge cases.

> > > That csum field will need different handling WRT the inner one - as t=
he
> > > outer csum is optional.
>=20
> So that I understand, is the plan to allow only these two
>=20
> 1. a zero outer checksum + inner checksum offload
> 2. outer checksum offload + inner checksum offload
>=20
> And skip trying to support PISO?

That is my intention, yes. Additionally, I raise a doubt about PISO
feasibility in the virtio net case.

Let suppose virtio support PISO, the device transmits an UDP tunnel GSO
packet, the driver receives it and fill the skbuff. The inner protocol
and mac are unknown. Even skb->encapsulation is left zeroed. When/if
such packet is later S/W segmented bad thing will happen.

> I don't think many hardware devices will support 2, but the focus here
> appears to be VM to VM.

Note that even without PISO support it should be easy to expose GSO
PARTIAL support on top of virtio_net, even for packets requiring outer
checksum offload.

> >=20
Thanks,

Paolo

