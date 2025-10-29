Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310C37A3A4
	for <virtio-comment@lists.linux.dev>; Wed, 29 Oct 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743108; cv=none; b=D6NpjrV9XIBbf/9u53e8/ER1d7V9dzXMTiIlnkfMbF9ifQGqCiPm3ymzgA1yybAtNImbwtDBvxdtK9nlHjx9VSb6fY9v7tCTfLWjxwj2CkLDWn+lfrgqGNy1dPqk8jytoA1h73hjNXq87LkuG3e9/2/a6hoANbWga/eGlrc7SsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743108; c=relaxed/simple;
	bh=VppV3ktc07Hb4sF2JuxCsV+Xj13W70b7cAdW94Ikp4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtZ5MWsDotum27Jx/CEPA0dRYnUjKVIVioZea898o0qXEcdnt2h3QXt1uLpKwKv2yL0acMfvaWxrillVdUpA9lhVj/b9eA4/bJezXnwEmLt2IPHzLw23qGXKqlsEhTC1keq/FFnhSu1lErJCkBiu+ajGzoNGZAnP5NCSLDKro7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x7hBsSCV; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x7hBsSCV"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so13233456a12.2
        for <virtio-comment@lists.linux.dev>; Wed, 29 Oct 2025 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743102; x=1762347902; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ov+xoprUN1edZnUtB3LhW4NbDtJ48o6WmdOFbRNSdg=;
        b=x7hBsSCVtw/hC57Mu6l7WRuHpYXJh768VVlUEMoDiz7/gAPgXb/g7zLwqli4287m1M
         swyz5zutbvKy4mKdqGG/Laa6dwkORXk+Yyk3489kX4+NztdJnm9IGfk9iNUYsKoH63Tj
         AJfVQgHNiZDcOX+1L5TAu3fPLLTaptHyiDQIejzmUo8htcMe1tyWZpXtoXNaCtGIPQTP
         /o5fpU8sNJIhwCGt4872+rXXuwMVBRmpSSp759UT5rihdEbZXESCxXTkAWec+xg5OQBy
         1IDf5yyn0zmIOl0nGyPUpAePMUmInJAWipM10QuNtvY8YzGGp1v0FB1TkO1iVV8lXiLg
         g/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743102; x=1762347902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ov+xoprUN1edZnUtB3LhW4NbDtJ48o6WmdOFbRNSdg=;
        b=DMQxUtz+jCQeZedAfZNDd0IbHyZXqdsrKoJDMgUtYCVaK/CHLNiS4TSqQh7S7C1Wfr
         DDDFZVvezl8M7l1+4uQKPwCtYoJBNhK2d8LGqKnvq+jz2j1zPtyGOq9eJooCG/Nxn/XB
         N8vubgtc26J5gJGIcgturaX0DS4GEHAJyO4fq3ndoNYqtbtaBNXO59oYZTCiyI7hsl8G
         6kZsDb+ByzGXVafiJ1V7oAimipHfCFjk9OkOE6+tPrLzCbEsZ3FuhuR7uLPiQVtOBcmn
         dbfy7p/Vsx55zhu5oWnIx2tmx5T3pAAri/2F/7EsDkNiwE4z03DG9qkct7J7n3Otfmyy
         wJ+w==
X-Gm-Message-State: AOJu0YxF0bihC2nzqJF6ryZO7zXxIrx34523ObofqFDgkPXULlSItRA7
	+KO/04jFWPnYKa3bzumjxNOW0YNRXqrVJX+fR1kDiSWkynrj9V06/S67Gr7D9MEhn0ADYFYi7Bc
	SiJPfzxSGA/hCwpHU41PQ2nIDHRVYJ4qY2B51jJpyiA==
X-Gm-Gg: ASbGncshysB3Rw8DU1KzE/EpNjGjD94gYSlbyBYd2KY63FjrKzQ6uKVFFkGZXggPAG3
	8q3fmp2fyopfUnWcIgWqMpNYAFtGU0xdcxXnC3Nr2dGmEMJZ6N7/CnhVZe88OuQugP8l1wRG6Dx
	D1IH7RIWc5aH1J1jv6mGyWWeZWRvUv3tasG0qy3dmJVbv7vD1tADP+2aDFZMKcTViS8qVxPde0M
	v42tkMvOL4O6MIb9yoMURGWXeDTEqPqCxFKErCli/xl7u42ErM/o6/n6Xac
X-Google-Smtp-Source: AGHT+IERJCG7CBpVpPoebtVLZtJJr1dOPK+8EFwYRYqJdPfKCBVUlrkRsmkaLOMLr6sQ9xvXclPtSR6tfm9a8KwXOik=
X-Received: by 2002:a17:907:3fa1:b0:b6d:6ae2:b66 with SMTP id
 a640c23a62f3a-b703d2f62d4mr269084766b.20.1761743101648; Wed, 29 Oct 2025
 06:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 29 Oct 2025 15:04:35 +0200
X-Gm-Features: AWmQ_blsTTVjTWJyxvhqA27S8qBg7hYJRM3tQIscSAIIs3O5wxyhboxAsu8agXw
Message-ID: <CAAjaMXbaWJirrf2bbGQAo7R9nrQBjZrgbVY6BU-Z12njHUq0=g@mail.gmail.com>
Subject: Re: [PATCH] content: Reserve ID 50 for video encoder/decoder device
To: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 10:34=E2=80=AFPM Alexander Gordeev
<alexander.gordeev@oss.qualcomm.com> wrote:
>
> Virtio video encoder/decoder device provides a stateful API for video
> encoding and decoding.
>
> IDs 30 and 31 are already reserved for devices providing only one of
> the two functions. There are use-cases for a device providing both
> functions, so a new ID is reserved after a discussion on the ML ([1]).
>
> [1] https://lore.kernel.org/virtio-comment/20241223055543-mutt-send-email=
-mst@kernel.org/
>
> Signed-off-by: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 5de811f..243ce2d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -803,6 +803,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  49         &   USB controller \\
>  \hline
> +50         &   Video encoder/decoder device \\
> +\hline
>  \end{longtable}
>
>  Some of the devices above are unspecified by this document,
> --
> 2.43.0
>
