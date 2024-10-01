Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42918D65A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772710; cv=none; b=ApEjVintbBCjt4XGN76OCTg5ToxOrcOiRWkWRh7aVp+0oGZFb9l19lKrIvE8rUxiKamZ8stqhuteAU8i4iTdDb3BUoPTM9tlJx43j/Gv+dVDSGuKKQ8C2aa0vvknC7Ei8voSJ8wye82vq6U+DmeoRMYgBl/cTiigQunT7T0cIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772710; c=relaxed/simple;
	bh=GY3G4lSHOZaFeuK8iN0nDmBjtrnuCgy9gkIyPZjxbt8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LUoXSWiQuRWknxRDnAiHTg8zPWQ+0p5jK777Zt/Gzl5hW1MuE6j+NenLlj7EqHun3k8tCCaqEV0NWnlVi+6h4YUCrKcSfjPljHdeObLzJ25i3453ry2lL0ZIHPuvRO/XPDKt9t63fDBC7MNt+7S09p/wTeQ3ZObl3EvBhzOnIdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EJ93nVi3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJ93nVi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727772707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GY3G4lSHOZaFeuK8iN0nDmBjtrnuCgy9gkIyPZjxbt8=;
	b=EJ93nVi3Z8idmwJ6xWq21vfSsnazoDAUB3C69EAZ7ZqeCyVYldy2P+HbyKmBZBuKedX+Jz
	/OztboBBRAg2Kh5xvQqUxWWBGF2ptwece5j3xXEUp5YrFn0JY+SrmPdMkcdOpZnUP7PJ4a
	P/uEDHCgj5GOBDG9WKrDUso61/Ox8yk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-Sd05XVtZOUSjf3Xwpntwvg-1; Tue,
 01 Oct 2024 04:51:44 -0400
X-MC-Unique: Sd05XVtZOUSjf3Xwpntwvg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6202C19626EF;
	Tue,  1 Oct 2024 08:51:43 +0000 (UTC)
Received: from localhost (unknown [10.33.192.244])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F47C1955DCA;
	Tue,  1 Oct 2024 08:51:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Parav Pandit <parav@nvidia.com>, Albert
 Esteve <aesteve@redhat.com>, "virtio-comment@lists.linux.dev"
 <virtio-comment@lists.linux.dev>, "aiswarya.cyriac@opensynergy.com"
 <aiswarya.cyriac@opensynergy.com>
Cc: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
In-Reply-To: <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 01 Oct 2024 10:51:39 +0200
Message-ID: <87ikucrysk.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Tuesday, October 1, 2024 1:35 PM
>> To: Albert Esteve <aesteve@redhat.com>; virtio-comment@lists.linux.dev;
>> aiswarya.cyriac@opensynergy.com
>> Cc: acourbot@chromium.org
>> Subject: RE: [PATCH v3] content: Reserve ID for media device
>>=20
>> Hi Albert,
>>=20
>> From: Albert Esteve <aesteve@redhat.com>
>> Sent: Wednesday, September 25, 2024 12:20 PM
>>=20
>>=20
>> On Fri, Sep 6, 2024 at 9:08=E2=80=AFAM Albert Esteve <mailto:aesteve@red=
hat.com>
>> wrote:
>> Reserve device ID 49 for media device.
>> Compatible with video encoder, video decoder,
>> and capture devices.
>>=20
>> Signed-off-by: Albert Esteve <mailto:aesteve@redhat.com>
>> ---
>> =C2=A0content.tex | 2 ++
>> =C2=A01 file changed, 2 insertions(+)
>>=20
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..6d6b3d8 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>> =C2=A0\hline
>> =C2=A045=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=C2=A0 =C2=A0SPI master \\
>> =C2=A0\hline
>> +49=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=C2=A0 =C2=A0Media device \\
>> +\hline
>> =C2=A0\end{tabular}
>>=20
>> The id 48 request was made several months ago in May-24 for usb, no furt=
her
>> interest has been shown on it.
>> Better to avoid holes in the device id assignment.
>> So id 48 would be better to use for media that has interest.
>> Added virtio-usb proposer to thread to see if it is still interesting, i=
n that case
>> 49 seems good here.
>>=20
>> Given the voting has started, I am not sure if the real id value matters=
 as long
>> as one of the unique id is reserved.
>>=20
>> And do not prefer to restart the voting for such a small change either o=
n my
>> late observation of this hole.
>>=20
>> I think when the maintainer merges the proposed patch to assign id 48,
>> should be fine.
>>=20
>> Michael,
>> Are you ok this way? Or you have better suggestion?
>>=20
>> Aishwarya,
>> Is virtio-usb still interesting? If so, can you please request for the v=
ote? So that
>> we avoid the hole in device id assignment.
> I received auto reply from Aishwarya's employer that they are not reachab=
le due to acquisition.
> So not sure if virtio-usb and 48 is still relevant.

OTOH, a gap in the id list doesn't really matter?

