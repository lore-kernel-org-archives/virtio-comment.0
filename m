Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E72EB5B4
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952581; cv=none; b=rC+fpjj8hz5YfnJT5SbOoHjBWXCb3QHcSjawotaulObrPznpca4eS3PsCDwu5loZlyAlpZQqaGrNTykymDIKemrlR/McKwDdsHhQvKatCg+3jeFAEHPgkNjA9Szfoh0/CfHEw2DuCe2BTsaLCYn9ATfV96AH+PBAb6Yq4RW1HEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952581; c=relaxed/simple;
	bh=A8gedh7zCZe2rZCk9FQswqWZQhLe7Fc6yB3quQt31oU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nyVx4q7WcId4OFQG8Jj4iLLtzGTsq9Yq12i43nkkyDKQZhHiIs44vDrY2plJGiyNIcPLuqWaNVNw08tQ+hg2N+35vRhN+lAZD796xn2Ffd7tJluWWEu4sJxGg+G7td+jmCoyxpMI/6jensFvDo568eULWYTmDP0aUemQ0700bEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNurzM4Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNurzM4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750952578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmLEH/YeYuw91FUUujareuSIiyD3+jyLBnv97XDaLT8=;
	b=cNurzM4Qcp5513pIXyFIJJD/M8UhNPKXw3gYvA7YUR0StbDdJnVKRIsuU9rKUYXzS3nTeW
	6vGvHZ+hLezoPBh0dUJJLrfd2GULgOIylxgu8x3V0VNwgBq+tDn9yqwRSngffETrzSd4+p
	dIX/XODptyFIP1IyVr9mpp/b8aDDDO0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-HljZuB2dMlCH_neyy_Wzgg-1; Thu,
 26 Jun 2025 11:42:57 -0400
X-MC-Unique: HljZuB2dMlCH_neyy_Wzgg-1
X-Mimecast-MFC-AGG-ID: HljZuB2dMlCH_neyy_Wzgg_1750952576
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A956180028D;
	Thu, 26 Jun 2025 15:42:56 +0000 (UTC)
Received: from localhost (unknown [10.67.24.50])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 742FF195609D;
	Thu, 26 Jun 2025 15:42:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
In-Reply-To: <092e01c6-1756-4293-8183-8efea6720548@amd.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 26 Jun 2025 17:42:48 +0200
Message-ID: <87pleqh5l3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5MpFCSdElxbbQrttUvtNndk4cQ0Cn0QkVv0X4VkCog_1750952576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26 2025, "Zhu, Lingshan" <lingshan.zhu@amd.com> wrote:

> On 6/26/2025 7:59 PM, Parav Pandit wrote:
>
>>> From: Zhu Lingshan<lingshan.zhu@amd.com>
>>> Sent: 23 June 2025 02:07 PM
>>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>>> Initialization And Device Operation /
>>>
>>>   Thus a driver MUST ensure a virtqueue isn't live (by device reset) be=
fore
>>> removing exposed buffers.
>>>
>>> +\section{Device Suspend}\label{sec:General Initialization And Device
>>> +Operation / Device Suspend}
>>> +
>>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend t=
he
>>> device by setting the SUSPEND bit in \field{device status} to 1, and th=
e device
>>> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>>> +
>> You ignored the inputs.
>> I do not agree to add the "SHOULD" normative wording in the general desc=
ription area.
>> The reasoning is explained already.
>> Please adapt to the existing style of this spec to keep the normative in=
 requirements section.
>>
>> If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>> device by setting the SUSPEND bit in \field{device status} to 1, and the=
 device
>> sets the DRIVER_OK bit to 0 once it has been suspended.
>>
>> Is this really that hard to write above way?
>
> I believe you totally ignored my replies in the last thread.
> There are no rules forbid using "SHOULD" in any non-normative sections.
> Now here I copy the reply here again:
>
> In the spec section 1.3 Terminology, it says:
>
> The key words =E2=80=9CMUST=E2=80=9D, =E2=80=9CMUST NOT=E2=80=9D, =E2=80=
=9CREQUIRED=E2=80=9D, =E2=80=9CSHALL=E2=80=9D, =E2=80=9CSHALL NOT=E2=80=9D,=
 =E2=80=9CSHOULD=E2=80=9D, =E2=80=9CSHOULD NOT=E2=80=9D, =E2=80=9CRECOMMEND=
ED=E2=80=9D, =E2=80=9CNOT RECOMMENDED=E2=80=9D, =E2=80=9CMAY=E2=80=9D, and =
=E2=80=9COPTIONAL=E2=80=9D in this document are to be interpreted as descri=
bed in [RFC2119] and [RFC8174] when, and only when, they appear in all capi=
tals, as shown here.
>
> RFC 2119 says:
>
> SHOULD This word, or the adjective "RECOMMENDED", mean that there
>     may exist valid reasons in particular circumstances to ignore a
>     particular item, but the full implications must be understood and
>     carefully weighed before choosing a different course.
>
>
> Here this "SHOULD" exactly conforms to the definition.
>
> "SHOULD" has already been used in non-normative sections, for example:
> 2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD =
read these fields multiple times until two reads generate a consistent resu=
lt.
>
> The spec does not say: =E2=80=9CSHOULD=E2=80=9D can only be used in drive=
r or device requirements section.
>
> @MST, we need your input
>

Not MST, but you can have my input.

We refer to the RFC for the definitions of SHOULD and friends, it does
not say where to use them.

The intention is to use them in normative statements only, so that
implementers have clear guidelines on the requirements. The legacy
sections are arguably a special case (for implementers who want to
support legacy implementations.) I don't think we want the all-caps key
words leaking into other sections (any more than what might have
happened already.)

