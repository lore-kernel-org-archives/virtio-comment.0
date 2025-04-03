Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277032512E8
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699313; cv=none; b=Q7WMlQ/giXXAfwRlpxbTR9dva0AhTNAvTmHwarOd80EPxh1lLMs5pAt5B7umQT8UhP04Uj9WHRBbO8lkUc/AQOdkLpgOaJMsU5QycqmIrRGMzFPqQSTn6q2BX06K8BORAwszaJEbJC+eVDMDLDrxS304I+Wrzus9Tu3zVNTN71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699313; c=relaxed/simple;
	bh=4BoBoFwbPsuPJVIOuTu8xLQ3033c3hH+bX/X6ZXXdUE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDhNVLQjWfdNYHkufiapOF3C+fiaD9cP3miq3/Zr4f9J/DqmPGB0mB2rEyp/H180UTEsO0LAP52dyYiwQcGLRTCIC+Ruh3XsrKcVsKJcmm4VSwzqQYy2sxA7c+DOWQDJp5kmjgbTZa+mN7fFpo4ymgYoteA0bp9zGH2FTpW/u/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLqfz5ol; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLqfz5ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743699310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M3KCG/3vFYa57AaJWwfy/vT3bIqqbWtAbcEcN9rtRfk=;
	b=QLqfz5olof/e8cax0rvhm1HyIcOwh/V6EnTP89LKdcYTg2/oOSzvUyq6sy+672lD500qOG
	MxzHVl+HrmkDVEOdpsK71sqnRA1iXoAdPBBasVdrC1JnsxA2eWeWJddPWbNLGVbs0FoLOr
	6dmiZT1maS3am1uvaSzF008JLn1McZA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-Hijo6VqRMPiVV0_2WIYvZw-1; Thu, 03 Apr 2025 12:55:08 -0400
X-MC-Unique: Hijo6VqRMPiVV0_2WIYvZw-1
X-Mimecast-MFC-AGG-ID: Hijo6VqRMPiVV0_2WIYvZw_1743699308
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736cd27d51fso1080892b3a.2
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 09:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699308; x=1744304108;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3KCG/3vFYa57AaJWwfy/vT3bIqqbWtAbcEcN9rtRfk=;
        b=Lng9QaNDWAN8q47MGgrwwWT+9TrmFqAT3H9kTGd/5t/nxHCmQ8OHrXAmaeKX7Zp3Yu
         0iutXcnjFd8Fzq7Z4sP5GCnSNCJsQ0Oqb2c0tBz0IP1oE7IFsxXSQor8U7INLRMdxjyb
         PrQflbDVxLs5DOnOtsnUsaenrwN3yx9xHTG7r4t5haqTIYrtq3JlYy6+UcQhmQWHuXcu
         iNHnoqLszPlNkJX98vpduY0gySVD34lf2qqhzaCyjtDvo5TiI4wFVWA+A/MzszGuCdlz
         tYzZfJxjoIDSk8Vc6fOi/hhYqPgH4W2pACcX7LddUnHFiKP2CRUrLI6dFxODDdEeRGGK
         nkqA==
X-Gm-Message-State: AOJu0Yyni5S+MjidT2CLZkKzCors0VVHbUaZtPMXhQscLq+WTB+u43Na
	pMsDqzHtMJpk07bdrH7mTHgs1aycrobRL0Ztgu0zmpZfWaEFPiaYkJTyaOcyfcI2ZOcmhpiS60L
	NHddbOJxgNm0oFJvze7JTTE9/tEo+DVa30HADNEsUrW5wkH26ywb36N3DydS8W5Uj0ralKREfw5
	ACZ7aPkbgT62EvqFE8vKk3ywU19ex3h6CdN5kvZPg=
X-Gm-Gg: ASbGnctkXd04H0pD+Jv1mymXmm6H5cdMIcwJEvjCwRzwDCNUVSGgrkA9F7CI8IwsFyK
	5V2XlFmhla0XrtFd6zxi9xGnEEPZX0D+rGhUpmlGFEMnqrnxSTBlNsaGt5R1rVHiSrmw3eg==
X-Received: by 2002:a05:6a00:2e16:b0:736:69aa:112c with SMTP id d2e1a72fcca58-739e4b4d68amr297108b3a.9.1743699307679;
        Thu, 03 Apr 2025 09:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2TcGUXIEQk+8G+SfhMHiJ5vPr1hroIOK4e8jImM2A1RDA4yGYdrK/sd4d09IzW5GqN6QYuIX29jadAi50HYg=
X-Received: by 2002:a05:6a00:2e16:b0:736:69aa:112c with SMTP id
 d2e1a72fcca58-739e4b4d68amr297082b3a.9.1743699307242; Thu, 03 Apr 2025
 09:55:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Apr 2025 09:55:06 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250403122328-mutt-send-email-mst@kernel.org>
References: <20250401174203.161991-1-slp@redhat.com> <20250403122328-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 3 Apr 2025 09:55:06 -0700
X-Gm-Features: AQ5f1JrjqajhJetD5wM0xKyZp_6RS0ly2vSW3EtuIYmGOVxr3xFinVotcMZGFu8
Message-ID: <CAAiTLFVNHJ8P43KK786khUAPCjHGKV9_dFYMPvkReCLYDx4xAw@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: support blob alignment information
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com, 
	gurchetansingh@chromium.org, parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dIlFP9ef_tsqkWXCF6Ho744U7Ej2fbJ7WwlCJc5LAvk_1743699308
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Apr 01, 2025 at 01:42:03PM -0400, Sergio Lopez wrote:
>> Allow the device to require certain alignment constrains for blob
>> resources by extending the device configuration with the field
>> "blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
>> feature.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  device-types/gpu/description.tex | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
>> index 4435248..8e5258d 100644
>> --- a/device-types/gpu/description.tex
>> +++ b/device-types/gpu/description.tex
>> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
>>    resources is supported.
>>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
>>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
>> +\item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
>> +  \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
>>  \end{description}
>>
>>  \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
>> @@ -52,6 +54,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / D
>>          le32 events_clear;
>>          le32 num_scanouts;
>>          le32 num_capsets;
>> +        le32 blob_alignment;
>>  };
>>  \end{lstlisting}
>>
>> @@ -67,6 +70,8 @@ \subsubsection{Device configuration fields}
>>    supported by the device.  Minimum value is 1, maximum value is 16.
>>  \item[\field{num_capsets}] specifies the maximum number of capability
>>    sets supported by the device.  The minimum value is zero.
>> +\item[\field{blob_alignment}] specifies the byte alignment required by
>> +  the device for resource blobs.
>
> byte alignment means no alignment restrictions.
> I think "alignment, in bytes"?
> I also think you mean the minimal alignment.

OK, I'll replace it with "(...) minimal alignment, in bytes (...)"

> Also please specify the legal values, like other fields do.
> Is 2G alignment always going to be sufficient, in your opinion?

We know it must be a power of two, and the minimum value is 1 (2^0), but
I'm not sure what to specify as maximum value. Should we state that is
4294967296 (2^32) even if we know it doesn't make sense in practice?

>>  \end{description}
>>
>>  \subsubsection{Events}
>> @@ -672,6 +677,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>>  resource. There is no restriction on the image/buffer view the driver
>>  has on the blob resource.
>>
>> +If VIRTIO_GPU_F_BLOB_ALIGNMENT is set, \field{size} must be aligned to
>> +\field{blob_alignment} as defined in the device configuration.
>> +
>
> set where? you mean has been negotiated?

Here I was just mimicking the style from the previous paragraph:

---
If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
resource. There is no restriction on the image/buffer view the driver
has on the blob resource.
---

Thanks!
Sergio.

