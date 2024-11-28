Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7A126C08
	for <virtio-comment@lists.linux.dev>; Thu, 28 Nov 2024 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732762866; cv=none; b=qUOhddsWA0v1Ty5Le9iKRFjkSv9ERNegyUw3PH+PMR5Zi2To00V79+R4jPN0mMPodOeywjYJoXk+2RY4ddbnlo8AfSINgb39vF8VYA+xCn1el+WI11YOdxGCIUbpSm8Zv4Qquv982UI6a0S8Fw0KbvHnXHczxb6Z+BjkbfXr5Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732762866; c=relaxed/simple;
	bh=HG6YcA8m6pzX70It5rOg8xagxpWOBhJRyxhb/bdBiOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjU6YUac7/ZSzNeuzKx5nxkmuGiLb/koZfaXjoc+PT1Gzz6CIk+o/f65gIM/4gED9jK4jAQYXNFPrjf7y8rFFGgyod88c1kdQgqLg8e6AqVGdiAosh5XApHgOlnipLsIeyvO+Lgd058xLWOA/Hkwh3CQ+vI4dNnO1GeO4c20xEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JleNngOL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JleNngOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732762863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG6YcA8m6pzX70It5rOg8xagxpWOBhJRyxhb/bdBiOM=;
	b=JleNngOLkU9hBeAIsSclU7yschsePsd2flI4FoOf93EzgYh83YJZTRnfnNfDBJWewY3RGk
	zmFFeqcOSSCV40zddScAmMCcbyAm0fFDcitjFuX9BpI5Dld0bl0LAkUZrdhV8+VKAs+JGB
	GsVTH7+Qa9GJtm8PRydvPEn42vMtyx8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-pshdub4TMOyVVlYlSlkQVA-1; Wed, 27 Nov 2024 22:01:02 -0500
X-MC-Unique: pshdub4TMOyVVlYlSlkQVA-1
X-Mimecast-MFC-AGG-ID: pshdub4TMOyVVlYlSlkQVA
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-7fc2bdd115cso331757a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 19:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732762861; x=1733367661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG6YcA8m6pzX70It5rOg8xagxpWOBhJRyxhb/bdBiOM=;
        b=G3FzJBVnZcKrNpO8VYYRuJDTroK5GmtAXT+Y/qhjBUugRN1leVXQx1RwI0C4NYnRoW
         yc+OKgCHVuXWnd8n3pbDRUxAaG84BbJPhESEq3vngiVr3/TUxVOVw9mcAg0vw79jy/Wj
         Fvg6F7OxxRoxnmCuHkIcPEaHH31+2AudCkfZVX2vdzRqWLY7fNtai9Osi9WRWZwMV7dc
         VQYxNpZSa85ry7xHYwiTjbibMQzijApVLB8U42G6nyiycScmheFpanBzs+RR9vTpbDWT
         9xmrXvCSaLDVIa24vmPlzvywpfZJpV+VDW5SMoj/0JPz/WDOkjr1ak+olyY43tvGHhxf
         uvXQ==
X-Gm-Message-State: AOJu0YxZzAq1WnZWOAp8lxrlF2UIRd5k5MwWWN777JQkB5ZvPBrnmVUT
	xiAaK4CkqRiazHxCBxJOrlEBiwj9Gm62kttu8YnIPFaP4+eCt4qJ2lCJ5h/NDwx1+E2aJj5X8py
	ca4d6KxvwzRxa+ZSnSLOnZrY4D+zWkO48efbbJxhcEPiZcMVeJn7fAhK+7FbaozNLWVmRLt2tNM
	GrPutoNHAubTKFwxJmQtQtPqPRE1txYoO4SUsYVUg=
X-Gm-Gg: ASbGncvsJ2ctnQkw9c/Hqbbk1YMUkh3SaIpWo0Axmkzb26elf/WxvAbS73LTncp63wb
	3flF06h2vdnnvN3xZz8uXBiOxOHkJ66PP
X-Received: by 2002:a17:90b:1c89:b0:2ee:1ae:a247 with SMTP id 98e67ed59e1d1-2ee25ade311mr2558951a91.8.1732762860961;
        Wed, 27 Nov 2024 19:01:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9M2JRqSA10jFAk3RUS/w+rsSNsCO95aVwdg3LJoKXdcszb4lRlphNsZDk4K8JAj7Nad6hFL/s3jGKf/EoSQA=
X-Received: by 2002:a17:90b:1c89:b0:2ee:1ae:a247 with SMTP id
 98e67ed59e1d1-2ee25ade311mr2558923a91.8.1732762860601; Wed, 27 Nov 2024
 19:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1732699986.git.pabeni@redhat.com> <81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com>
In-Reply-To: <81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Nov 2024 11:00:48 +0800
Message-ID: <CACGkMEu+PdSLSrhmqbs236eEKpBnSDFwLP5go8H3T6j2rcnbCA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QQ6oeHP8lI0d2m7aec8Q5IKdPUwZP65RFs_JttoR6YU_1732762861
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 5:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The current wording is a bit unclear hinting to possible additional
> nested headers. For GSO packets virtio net (currently) supports
> offload for the checksum of single transport header, explicitly state
> that in both the driver and device sections.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

