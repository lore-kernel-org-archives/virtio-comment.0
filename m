Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8BFF4EB
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 05:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716875440; cv=none; b=pCcVmEGyUOT38slZR09kgTdG5U7aN0aZkSGC/JzJtC32IZUMjnxL9y/OWMXlRyjAPSod2mJuHTpxy9a6R5nOE3vPpl6BYFVQ3wYV3hQJ2IFjuVMPujqAJb88uZdxd5huvEgBYjtYj/ALJ6BxEQdmPmqT52Kn37vHBfnn7DsiYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716875440; c=relaxed/simple;
	bh=iYDyWGYP0ENpxjxt2PqaBIwrEXTfMdtM9TWTTsSi1DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2yFOkxgW0oisLpkH1qVozvB/vwdXtTWIip7qT6jdqUoRxJc+CPrNIioOIGVgwr4sFkHF61J5RhpvTka93cmFPXHCENqK8ym4Zzi3DIylHu0t2m+5MqtpD7/ZcrBx3TKvICHs2MGYmfFaBfEeXiRLLRxy1vLqEAbunElhw0U7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUik/6sJ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUik/6sJ"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df4e503983fso440459276.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716875437; x=1717480237; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MoK6y8T+Mu0vVs7vC9q2ywN+/oWeNaa/EhW0nhSy408=;
        b=GUik/6sJouot/08926g3pP+1GvqVpwuJ2ZqqRf4BTasZUJSoGVoSZahb6MDx8X/l3z
         Grz+OtbA4UFjwqUl6SsXDDL8BJx2sAtMrIoYgMJ3AMq+m9LuROVgYeeWeoihuJDmwyd5
         SvRueKFqhuO3LJNtK8xz72h3/Jw4xMmK7dZ1SASEGT7u7yAVtRfrlurNo60nqo4S36TQ
         Dyg7v4ilj9KP9OWVM22dsD4VjjpJWf1MRKVZKLQDoeGAE17OKopPdWy/ZUhH+D1WSedV
         x+PVinQIFbCpiDYyLj+w30OQgBqOro8UsZCK8Xw1VdJ7yf+A5Fdt9B4gPysq8Od4LVzX
         qb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716875437; x=1717480237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoK6y8T+Mu0vVs7vC9q2ywN+/oWeNaa/EhW0nhSy408=;
        b=NzCPKri/FvfOHrDqAeRXFdTu3OoUR4wMxxJ+b3Sn2DDctt3bH4t4agTc6fpbkgxfQ2
         bggmyCyBNKOFhR7a9vpb8B6um+ypjwYQwbA0rP2Mrsn/Y/PE3BJJjN0nqWoVCGCmY7CR
         riV1ybdwcAf2CIYndPvAXGlpOL+pXU3vP3vFa6CfG903Lks1S66Y2ye480VfHiWujkSo
         BP2lxZqRzdgL9l9d/fJqao8t0CW0lNT18TUcEmvD9BvulNhlAUF6Guiqab3giAcNld75
         xPChY62JX/ehrNWPL1kMMUpWRtbZu1Uf2mwC7hW8m1B3CBcttUOKMRImhOb5ImO0rjfG
         4dZw==
X-Forwarded-Encrypted: i=1; AJvYcCWePJrNsLc9rSlAq2AwfQ7w8p4mmPNfU2yMXH1Xr8jb6Y56G02jxKVLKDmaKEKVVgpcREyXYeSFRYm42oFDuZobyyAVJcQSNdGBh74w4JM=
X-Gm-Message-State: AOJu0Yw09ezgyK62jtUlbI0vLCnKayguFzLX7HIALtASZVNurFQoujmx
	g2MBCIPVDIinp3biunu/aXduscTfQNyhL5gcZBEG2IrjpG/LZ64DPxeZycHa1inuVjrI4sYoigM
	gQGIUkE+erYnXH2hClckb8pADv60=
X-Google-Smtp-Source: AGHT+IGF4GW3WC9jtqEpqKAq995yc3lRjsnz8VrGllV+nUEDwiO2m5la9G6BQMO8qikFdHjqXCrOUDEFdra6rwPYNJ0=
X-Received: by 2002:a25:9190:0:b0:df7:7a90:26c5 with SMTP id
 3f1490d57ef6-df77a902879mr10089293276.32.1716875437353; Mon, 27 May 2024
 22:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20240528054725.268173-1-niuxuewei.nxw@antgroup.com>
From: Xuewei Niu <niuxuewei97@gmail.com>
Date: Tue, 28 May 2024 13:50:26 +0800
Message-ID: <CAF0OVnQm7i4Dhc34nukqWcYNmPNM6iFmUTkAAqMLg3QxPf3VxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] virtio-vsock: Add support for multi-device feature
To: sgarzare@redhat.com, mst@redhat.com, hi@alyssa.is
Cc: Xuewei Niu <niuxuewei.nxw@antgroup.com>, virtio-comment@lists.linux.dev, 
	fupan.lfp@antgroup.com
Content-Type: multipart/alternative; boundary="00000000000091319b06197d3672"

--00000000000091319b06197d3672
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CCing to Fupan Li

Xuewei Niu <niuxuewei97@gmail.com> =E4=BA=8E2024=E5=B9=B45=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=BA=8C 13:47=E5=86=99=E9=81=93=EF=BC=9A

> Hi, Virtio TC.
>
> I am writing this email to request adding a new field for virtio-vsock sp=
ec
> for supporting multi-device feature.
>
> The multi-device feature allows a guest to have multiple vsock devices fo=
r
> virtio transport (maybe for other transports in the future). I've pushed
> the first version of the patches to the lkml[1].
>
> This is my first time to contribute to the virtio-vsock spec. Please bear
> with me in case I'm wrong.
>
> Thanks!
>
> [1]:
> https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei=
.nxw@antgroup.com
>
> Xuewei Niu (2):
>   virtio-vsock: Add a `VIRTIO_VSOCK_F_MULTI_DEVICE` feature
>   virtio-vsock: Extend the spec with an `order`
>
>  device-types/vsock/description.tex | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> --
> 2.34.1
>
>

--00000000000091319b06197d3672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">CCing to Fupan Li</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Xuewei Niu &lt;<a href=
=3D"mailto:niuxuewei97@gmail.com">niuxuewei97@gmail.com</a>&gt; =E4=BA=8E20=
24=E5=B9=B45=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 13:47=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi, Vi=
rtio TC.<br>
<br>
I am writing this email to request adding a new field for virtio-vsock spec=
<br>
for supporting multi-device feature.<br>
<br>
The multi-device feature allows a guest to have multiple vsock devices for<=
br>
virtio transport (maybe for other transports in the future). I&#39;ve pushe=
d<br>
the first version of the patches to the lkml[1].<br>
<br>
This is my first time to contribute to the virtio-vsock spec. Please bear<b=
r>
with me in case I&#39;m wrong.<br>
<br>
Thanks!<br>
<br>
[1]: <a href=3D"https://lore.kernel.org/virtualization/20240517144607.25957=
98-1-niuxuewei.nxw@antgroup.com" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@an=
tgroup.com</a><br>
<br>
Xuewei Niu (2):<br>
=C2=A0 virtio-vsock: Add a `VIRTIO_VSOCK_F_MULTI_DEVICE` feature<br>
=C2=A0 virtio-vsock: Extend the spec with an `order`<br>
<br>
=C2=A0device-types/vsock/description.tex | 22 ++++++++++++++++++++++<br>
=C2=A01 file changed, 22 insertions(+)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000091319b06197d3672--
