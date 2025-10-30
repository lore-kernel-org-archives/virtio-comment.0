Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96023F27B
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808174; cv=none; b=Tl1/jfVN0xDvDYxGqtPoGeTq5z1iy6qsaeb2699BD0lzJn3Bnzwqmd/q5fCdjR4THyN68WFdLdpBaYMAHUHQTMRRD0vLU97HdDVgLNXECRd1Um/ojAq+7jl7bSlIaRJ7aFH27PtY2W5bk7+RcjcZngi57w9bwmR5C05lArIy6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808174; c=relaxed/simple;
	bh=RdUdresCChR6DhCKDksW4jHlHzYuqEsyd2mjAGzflDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlI6nBrM2v5CwjjMpqFVOq5fQ6oEm9gUDfPxJfoAGcjDWV6XnQzgPjOrBRpW+YmlWvPlaFXd8eqKBxLJnOvXzFs/08LaePJtIRbmvaH8Qe1zBcsg5nhIAQcgGdFaCrkpFRLGksvvY0obb8Ky1kYsDkwBAGABC6t+7xz1Pi67uzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQoQlyaZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQoQlyaZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c09141cabso1005523a12.0
        for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 00:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761808171; x=1762412971; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQDz9S/AN13ks8bpwfIlKDYTAkBBJhcyBqbXcpGVk0g=;
        b=UQoQlyaZFs9iQSzSNnv7Gn/S5pknIFxozn22N3M9yacKoh0BZ3dn1FnAF06VqDWQLD
         p3YSWCiPgPCyFPszWPSYK2zbVXuvfbFvQJCrOtDOXhUuA/OXOwJe7O7aECWwPTJRPsE5
         NjO1PPkwcQ6Ei0RzUT9/QkTwqIcJ2sEuQxV3+F51YpI7KIw12OXJz3uhM7TvoSBOjBp7
         5EIB3vtaDhVvj2m72PqO/4PvpFWZNyTybn4+wH6QgDhEiTC0/N8aFerEW1qBUdl8u2be
         q7Wl1Lw2KjRdSqnTB/7IYGy+VPM7DHsx2tMP5AqhrJrn2/TIDHGzk0fZ5oJ6T+Kyj+EY
         KCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808171; x=1762412971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQDz9S/AN13ks8bpwfIlKDYTAkBBJhcyBqbXcpGVk0g=;
        b=w2g13mBFVIytfU8ch/WfCAvct1psrKfPStCCIeiv5TvKTQvgygOTJox1AbVt2Ub1fi
         MAiv6iBkOlTAkeqBFF4vWfQpZUmIgpkWyBSOZObBwwBrBJVgvPkmTpLVnN1KRQupG9L2
         zT2GRoCVOAG9qcKHqOKzi7iojs7Z9FYuV77052OSZNRhFv9XfTPqXq/mUuezFADN5Err
         1ZXTbadN3ZqQlf56OolO+L+sT7mTWTunql+Qeja2+BX29A7nmutrdUPzHkgIKg0GI/GE
         hrRdGJmrXDbO2UfVBQYIDke3qnRdJb+m09tsvoIlgNcOUE5+iZw9OP1EKAcdBYXU1cxK
         gpzg==
X-Gm-Message-State: AOJu0Yw5MwqLJaJ0Yp7BtJRNM/9ff5Fe7BRK1msQ7Us4u8UihGNvJsIn
	Be5BaD80DThmE7gUICusQvpQ0a/O6uOad7S5gHR6hCHrD6bhZzXXw1Z2Kl565U/mboOpgIyObDq
	CwQbHKHfDfG5X6287PAE7nU62KubNbYD/vRcztFlSTw==
X-Gm-Gg: ASbGncsA/JLusFJQNwzd3GhwVaoe7Yw3G2ZyZI5ujf98/2e07GlMKGxGosFIy4D/Rst
	xPzlA0erdUFR2NEDL+uA59r5qRtFoBxWy0ON04MNxMzzIh7FBwoViRP5i/1ePQ6kTYNNd14KqZd
	ZxsryYeoJ8fB+pyvk5egohipB3Kb5jRopNG8aaetddf6rCPt6ALvNFNb0B+MQosOLT3bjGlvnwx
	YCEj9l3bLazl8+s/yFW/X8j+hOP4X5tS9GdHz8oMxCUj1CvUj4Xz6exRb3A
X-Google-Smtp-Source: AGHT+IFsOZ+0zb4nkfK5zYqfokNR+B3D3Xdb6y2GXi9l+iaT6RaG1471WSJEzwO4phYT+NrtGfwHXuqNrbI+ORU6XEA=
X-Received: by 2002:a05:6402:23cd:b0:634:6d87:1d28 with SMTP id
 4fb4d7f45d1cf-64044375a30mr4186212a12.35.1761808171274; Thu, 30 Oct 2025
 00:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010162858.4107388-1-alex.bennee@linaro.org> <20251010162858.4107388-6-alex.bennee@linaro.org>
In-Reply-To: <20251010162858.4107388-6-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 30 Oct 2025 09:09:05 +0200
X-Gm-Features: AWmQ_bk6TayAKp6h8UyYcKJwIxc3keqoHzX7Ktk_B_U4jtelFWhyz-KqrLInOUI
Message-ID: <CAAjaMXYCO+6170-HxJ7d=J+DL0CGvg2nfCi93Mi0+BEffj43cg@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] .b4-config: add project defaults
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 7:29=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> b4 is another tool used to apply and send patches. We might as well
> set our project specific settings here.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .b4-config | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 .b4-config
>
> diff --git a/.b4-config b/.b4-config
> new file mode 100644
> index 0000000..0ac4110
> --- /dev/null
> +++ b/.b4-config
> @@ -0,0 +1,9 @@
> +#
> +# Common b4 settings that can be used to send patches to virtio-comment.
> +# https://b4.docs.kernel.org/
> +#
> +
> +[b4]
> +    send-series-to =3D virtio-comment@lists.linux.dev
> +    searchmask =3D https://lore.kernel.org/virtio-comment/?x=3Dm&t=3D1&q=
=3D%s
> +    linkmask =3D https://lore.kernel.org/virto-comment/%s
> --
> 2.47.3
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
