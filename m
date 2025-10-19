Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92DA223DE8
	for <virtio-comment@lists.linux.dev>; Sun, 19 Oct 2025 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760874552; cv=none; b=ObJUQBOgX1P24kw9omqk9xkJtM++EHGBx2fzf9ShQdrS9e1gNoykozfGbj1huW5Kfgt7KGp5FP0n9iuW6mwOBWSHvEERkf8i9aZ+fS2hNLllTDiuNXJ000imKmw4Dru3WGPcR/qDLi3IIjWAxsw7GYJVqvYLVJzVekMg/YXShIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760874552; c=relaxed/simple;
	bh=75AdrgQ3fPJRZQz0Rj9K8kO0GiI7q7LbtSnmOhsn0h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JqBRa6ulbc4BgF1EsNmxLv1QlA3u+1bnhe9AOhjbaa6HeHds9Fh2qXtN813796HoYbraDX46bhz+H49WPaVyhRzoIFX4r16VB0+62DTAaeKelThEjKX2TnZrFopdn89N37yLnqPnkM/bwNk69cEnn/9mIaOPFsgBcweF0vftwSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEddwAuB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEddwAuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760874547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YROfnhhHJHwFtX9l8/OWKTgOAzyz+EWlOQan7zS8fog=;
	b=hEddwAuBfYrAP/CzSZK3ISgs0ykAxDiQ5oIwQE9vPju6XM5gRqgXeq6pngWJMHATfILWTR
	iJZ9FUaIKAHuRGwuo+3oxT58Sx70HC69cVEyvzTHuLzYvTKvQgL+SPRX0kWVM2PelZ02oj
	ZZVeze82Bqo2yRjfzf5pQyA/onPLsvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-z_lBL1PuPzGDxYk_d6yFiA-1; Sun, 19 Oct 2025 07:49:05 -0400
X-MC-Unique: z_lBL1PuPzGDxYk_d6yFiA-1
X-Mimecast-MFC-AGG-ID: z_lBL1PuPzGDxYk_d6yFiA_1760874544
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4710c04a403so35045905e9.3
        for <virtio-comment@lists.linux.dev>; Sun, 19 Oct 2025 04:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760874544; x=1761479344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YROfnhhHJHwFtX9l8/OWKTgOAzyz+EWlOQan7zS8fog=;
        b=DVPNgrUdwDa8xazdr7uoHa0pMQNFOQj2fpcsMGWB+BotCFW1e0sVXUuLwBaQnnDQLC
         967BLjI4tlEXmXevZOgCJWEU+6gRElG0yZ7ANApJ+01ZqtdtIbAs9sEZlI0xjBUAXY3v
         ActCwN8njLq8tfx2JJ6OjNGrIL5bYwnzCCtwi0n17v7zSCRIAHhCorFtn0Xh0DKOOkzV
         fYHYbFuIipwzd9x76TyfkQ58lFXk+jG1d++kmHsW3+QvuqDqpc/48lzOV/O0idjIQugy
         FugxkiBZXzIjON95FLDHxPUczZDTQA4ikGdUnFtUrlmHWWnrH+zy/skb1UrR7ursJ7tD
         9Veg==
X-Gm-Message-State: AOJu0YxJpDI/jf8G+M+vH/Oc1a00oiwpdFfTcgTC9tVKckVoiTV9MPR4
	iB0eKFxJw51ecDGOPWsrnLl4pmVEa1eWZ8Hlu8d78m3AVc6u2PASgCc5Yt/rB4UUxu8yrPhr5Wr
	Ze9NqniRWZsYEJHCN9QU0T+sWRb6dw4rflZOB+oadUityeh9ecFqcRWE3qSxHaHBw2ushoQ9BPV
	CO
X-Gm-Gg: ASbGncvYLPyvvcuex8f7NRa2iruWdb914CN26WQJJgPwt7f67luMg2wbdNLontZ8XyR
	kL+zf2Rz68nQj32WxM5olVaf1SF4miN0dUG62JwLOcT8aILuR/Yvrl5NtlfKe8ZkJTJxOVhOWc2
	7CUNuACmCoAcTriibeYsjSY4DAN9TTuPD5s+qSgw1GGzkT9ivw721qZGlBLwcymlqypHuSFDi0Z
	8SAThDEd6Paw+30qw52lFGIoCDWGVoPUktdR9/1nST1IXdBPDKDkbO6O2/nlGEMF5VY8D3RRJps
	zkWyE80VwXUUp1yd8/eE+vACr57SUEImd9fWO11FDWtE+QTn1LrnJTkDyTEM82gbgsaV
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-47117925da1mr54758805e9.38.1760874543956;
        Sun, 19 Oct 2025 04:49:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFXfmuEvr7ezfOEJDv3RENHkiN14cav+N3h3UcWnQ7xptRgUb7vNZa8HKak8KW9THG8tdwZg==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id 5b1f17b1804b1-47117925da1mr54758725e9.38.1760874543450;
        Sun, 19 Oct 2025 04:49:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm106585305e9.3.2025.10.19.04.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:49:02 -0700 (PDT)
Date: Sun, 19 Oct 2025 07:49:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 00/11] QoL tweaks and github action
Message-ID: <20251019074820-mutt-send-email-mst@kernel.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
 <87ikgdippa.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ikgdippa.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IVSpGWtzS5m68ZDuBPM1eTSwKJid_fUUZHpoLzv8T34_1760874544
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 17, 2025 at 03:10:41PM +0100, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> Gentle ping.
> 
> Michael are you happy with the marking of the draft now?


Could you fix the layout in the generated pdf?
If we are auto-generating it we better make it look sane ...

