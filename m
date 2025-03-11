Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D5262819
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 22:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730987; cv=none; b=pmxapZlCd32kZR0Qrj6/xnLiLsEFnpEOCcjpjhpdXF7G7AawBdEKm0Iwb2NXwHxzzx3RHbVA1mFJcq25CPSwjSgZ4x6Z46uYw5q5yBFPOyzbNu3HIaAi60sbxjYRVLXC5SJ5FDRX0NUpEWAYNVuoAGurA40CbaO2OpzKdFgHxDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730987; c=relaxed/simple;
	bh=iBl8XnWu9ppm4pWxO5Bkwg+yUNTeqjRBX7vaKUgMe5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pbglfR2HxKOt576LoqDK3ATpRjqdKEfu7ubpKUjUph9TJsG+7LcRh3s9f4ec/Y7S6Hes0cjty19yWkLrzJG/wwnhJiS7+381J6wuIDkviaTSf1LfIbeSXj23EF2FzVqMCsnnVBiJ3OU3STlWKh/c9+g5vR4ZMYWfPCGUCByQ9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWubuEeA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWubuEeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741730984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Gvys0ROMTbD6pJgs/0NRRjm32YYSWnDuMwU2QqCvhM=;
	b=BWubuEeA3mhiY9mpY0XmzO9pxYnc4BCJUTemf8CkQXc0uQfBpabu+9OnnlgXFt5Tt9F4Fq
	XhVj3KKDHNC2U9WGvk1dKWUO1nT4si/zDTvNeEW/43u4oFtW8wXfQjOowGSII2zUriR42A
	8k8SVxRlhDH+q6b9NILDqDBUlMI8G20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-NkRjHF6WNP6lmJIgFhw_UA-1; Tue, 11 Mar 2025 18:09:43 -0400
X-MC-Unique: NkRjHF6WNP6lmJIgFhw_UA-1
X-Mimecast-MFC-AGG-ID: NkRjHF6WNP6lmJIgFhw_UA_1741730982
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912580843fso4012217f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 15:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730982; x=1742335782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Gvys0ROMTbD6pJgs/0NRRjm32YYSWnDuMwU2QqCvhM=;
        b=hg+ScrunUM3+SxXkhwk0cw1t5dgi1MZcgHQtsNsQnuHPYuQXDIg4Vwq9WgWEf7ijPa
         /W82rqKQ34vt/Cy+vnniGV70S5cqPh6xJm97Az2tLkeOBhxkxV644nGiBid6JnoKkqMT
         oVaHtRp41VOvqBj6FOmZreth1B86u6mjrtkHa1TM9zQre5wqJ2GV9HnU2UzT+43/sKnb
         2oZkG35vQ+tOzmmy9rsAYUefUWC+aJ8y9Nfuc4A7boIn720JfaKYpByLtGOxDyTXby98
         xERbA5NKEjo4LR/aUW+PnHMfHp3gHcErZLe4FHQDHqt6yzQx0EhbDup2aaaSvhVm9zoD
         F4nQ==
X-Gm-Message-State: AOJu0YxpYnBEXJrGV7PvkRITq9UEwz66/KKRl8KceiAmdYdOkoIuAUPj
	DwVSwp9OJRREqBwOfXM2CK51M4+ULjDYPLhfCFxohQOkKnCANonDOwb967fMIJI/Y5286Fqe331
	NFhLW1hCHyFd08GOnu2bUfQorP3Ml1iiM8a54TALHli2A0e0UG9I0nXW3LUGb4swG
X-Gm-Gg: ASbGnctGjXfcxx6pkRYWm30/EF40i+aIrBA/1oBTPEa1jTof8BRO4sNOeXjFB+aeHIV
	cKZPiE87LQZi/6W3pB7QZbDe9KM6wIkIPKMEL6t5SUGEe4pTtUY0BMawkTAn+S/jQ2tAh0/B9ri
	UULiT8O6KF3ibIojizNHnjlGZFyTfWZtSb9sgL+If/nTB5Y2mtI/vkai5O15jtp6yXLYyyNTawm
	ZR7R0SqS5NOHy83fi8zdhnAMkhBpPPrnsMOfoudBB/XtsN5P4cHNwORpnI6yIfFDOPNH67jLRqE
	PGzuy8GsNg==
X-Received: by 2002:a05:6000:23c4:b0:391:4c0c:c807 with SMTP id ffacd0b85a97d-3926c5a55d7mr4191687f8f.53.1741730981757;
        Tue, 11 Mar 2025 15:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELzUNfdufUMOcymerkOtFEt5oDcRb6dykkEVZFEOT1gkwkipQ+UTgqu5OjLWQMfSgNQchhqA==
X-Received: by 2002:a05:6000:23c4:b0:391:4c0c:c807 with SMTP id ffacd0b85a97d-3926c5a55d7mr4191682f8f.53.1741730981462;
        Tue, 11 Mar 2025 15:09:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfe0004sm18768599f8f.40.2025.03.11.15.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:09:39 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:09:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH v4] README.md: add example email for TC vote request
Message-ID: <20250311180828-mutt-send-email-mst@kernel.org>
References: <20250311212030.1745812-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250311212030.1745812-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xxJhBu9X167lrJJTuCgjg3iADPJKsvdTc_zsFU5_fNs_1741730982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 10:20:30PM +0100, Matias Ezequiel Vara Larsen wrote:
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v3 -> v4: add "[]"
> v2 -> v3: use "()"
> v1 -> v2: add Subject and To
> ---
>  README.md | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c06caf6..f4b32ab 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
>  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC vote:<br>
> +<code>
> +Subject: [PATCH] (description of changes)<br>

Wait wait, this should be in response to the patch, no?

Subject: Re: [PATCH] (description of changes)<br>
In-Reply-To: (message id of the patch)


> +To: virtio-comment@lists.linux.dev<br>
> +
> +Could please open a voting ballot for these changes?
> +
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
>  and asking for a vote. </li>
>  </ol>
> 
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> -- 
> 2.42.0

