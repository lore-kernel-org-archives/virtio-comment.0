Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBB25A2DA
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104739; cv=none; b=jkqYD4YUHesbVkX161n9wUivrehLdV+Vm0J0yzcGECeBLbwhFGFe4/WW7luoNTWm7lhLeTCQINTHuoFSAdwCh4/l8QLJ1uo5uowKHOqfsw4EmPXpcXzEBN+FBCk8okbjv9ASSWjX202pWSqcMSFevcTfs2zx2+Lr861pJJVFdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104739; c=relaxed/simple;
	bh=LoXV/rJnJ/85icUl8piCaun018MFCKus7FJwB7ozEsc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jS6ICPD5Pha3p4A01GKPfDMmSK3v9UnxAfVZH47LYwYHfL4Ie1IgThVnjzaKgZaWniPM1mEab8kiBuRsuypABGryiSNdr36KHyeMDAS+QHQv3U6o8d+qaRCxpEzzKfS/Cj1arqYBdsIwShmwlors63OT/Z+g8gRPGXvC51YSiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klpC6bSo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klpC6bSo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so392971466b.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760104735; x=1760709535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ord+X5Wsg5YN25xHT+dYKwQJnQ96hVGWSxjWIlRim9k=;
        b=klpC6bSoHcFpkYQvWjz1W6g0jG8H3Hy3IdzIeYpJZDhx3r17TIiiyNs+UfNml1cMoW
         l3iyHeCwvP739i4Air0RFoCAUESQJAYfOZJgZ1CqVHZygQELLcmefLAcuV5/VBKiQwGV
         xsQcq/tiPUstGcF65+qlisGh7ViPX+qU31aoo65ObsRFdaAyxnLh63uIIVYOw1iO6Eou
         rtuyWSME28+XtyA7TLfAe2x8onh6Y+e0dNKnrIBFHxQR6kmKf/OV+mq579EJO3MSfelL
         l7Jw0pIHiUvkJh1RDuU/zN9Cs7FW0xliOuPfQlmjRfwsQlb9U2foYH4AAlO1u1Yunxiy
         /Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104735; x=1760709535;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ord+X5Wsg5YN25xHT+dYKwQJnQ96hVGWSxjWIlRim9k=;
        b=NdYd9zeEu5z+kfgDW4YJ6Oqm0JA0xIKewIBYbfX+0R5EWoAMhws4D9Shb6LqdDk9j7
         sVWJwuG15OrqFzeRAeLlRi5tAgkDZPM1CzW+WYe7XPndf3qJdlNvhO5VYgcF2u33WXql
         J8+oUQDdhRMYinTfcWwwpZZ7I69hz0LUVO+FlHyDzPLA0iN2jKEvM7WXWf1ce6pwmpIS
         +LIrH8519e7pBKKLaFeb/dd56xgHO+Hv/HuHkvLVgz0+Q7QWvoeBZseHDfXbHbBtOWBg
         hU3IdV8LcwcA/FuZ8J0Uc966zGJEMmpqLTf30o9ugucU72U6kqIRM1vurpetDF+6Q9Cq
         kjwQ==
X-Gm-Message-State: AOJu0Yzot2yPYtfn/NhY6huZA9gR/Z5gAzlShwqKsC1YUMrSrMN286VT
	0DyJal0VLcz8pDpHP7tY1XdNNwKhhpubfTQoSibevS88ZPuK4e99v6rK1uXBU2UNkmaP2pjpIpX
	XSfnx
X-Gm-Gg: ASbGnctVjfSglyN+tpsEUQKowh6I60vp9ERs6HPeomB/me1j3pLcqiLMPvSk4pUnb58
	so3qFEZAcVDRC7trodNXe2+DX1c2JEk20EqZ6pcefbpiv2yxmiikNRfpxP5AtBtP19A52gYEn/7
	pZaTPANppeT2iLAPSv/VXjGbN0SxFwJyTPo1ibwd3W4Xkm6GWH7wesQnqnMcl05ESHIbXgAweZO
	rtDL8hcl31lBiqg6GbaBsWLhDj9UTBRnWJf7rHYtBAxjy66t8Ae+uuPb+SAxROx9C3QJiOl0fYv
	euRQuYbu/IVknC7oYrJtv/Ql2Hd7KPAT5BUocwma+/9ILgy4mzW8Zo2IgjssOOTpNVhkPIum71Z
	tB/gM2/FGbFac66M8NyQR6ghUZkjQCgSSk3glluGqBza0fw==
X-Google-Smtp-Source: AGHT+IGGpD3VLEfFY0sqKYWtxuuaW02PN1r3C4L06//o5O+SCvQyUX54j+0O5fRvKUxKOpQ6kmAo1A==
X-Received: by 2002:a17:907:6d25:b0:b3c:82d5:2119 with SMTP id a640c23a62f3a-b50aa49157amr1094460266b.6.1760104735321;
        Fri, 10 Oct 2025 06:58:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951ceb4sm235412566b.72.2025.10.10.06.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:58:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A76175F7F6;
	Fri, 10 Oct 2025 14:58:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 10/10] .github: add a runner to build the latest draft
In-Reply-To: <20251010075725-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Fri, 10 Oct 2025 08:00:53 -0400")
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
	<20251010112010.3880438-11-alex.bennee@linaro.org>
	<20251010075725-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 10 Oct 2025 14:58:53 +0100
Message-ID: <87zf9yvowy.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 10, 2025 at 12:20:10PM +0100, Alex Benn=C3=A9e wrote:
>> This will run each time anything is pushed to the repository and store
>> the result in the release assets area of github. To see an example of
>> it in practice see the virtio-msg repo:
>>=20
>>   https://github.com/Linaro/virtio-msg-spec/releases
>
> Is this the PDF?
>
> https://github.com/Linaro/virtio-msg-spec/releases/download/virtio-msg-rf=
c1-Linaro-draft-v14/virtio-msg-rfc1-Linaro-draft-v14.pdf
>
>
> Some comments:
> I suggest removing the version (e.g. replace with X.X)

Isn't the closest version still useful (to know its not based on a
really old version of the spec)?

> Replacing "Working Draft" with just "Draft"
> Maye stick the hash there too?

I've gone with:

  Unofficial Draft (@ git 8c7a1c3 with local changes)

to make it clear its outside of the normal OASIS stats.

> I also see front page corruption:
> driver listing overlaps with related work.

I think that predates my changes - I built from current HEAD and it has
the some overlap.

For the unofficial draft should we just elide the stage information
entirely as the links it generates don't point anywhere?

>
>
>
>
>
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-ID: <20251008145916.2626143-10-alex.bennee@linaro.org>
>> ---
>>  .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
>>  .github/workflows/test.yml    | 15 ++++++++++++++
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 .github/workflows/deploy.yaml
>>  create mode 100644 .github/workflows/test.yml
>>=20
>> diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.ya=
ml
>> new file mode 100644
>> index 0000000..fec4910
>> --- /dev/null
>> +++ b/.github/workflows/deploy.yaml
>> @@ -0,0 +1,37 @@
>> +name: Deploy current state
>> +
>> +on: [push]
>> +
>> +jobs:
>> +  build:
>> +    runs-on: ubuntu-latest
>> +    steps:
>> +      - uses: actions/checkout@v4
>> +      - uses: xu-cheng/texlive-action@v2
>> +        with:
>> +          scheme: full
>> +          run: |
>> +            apk add file font-liberation make zip
>> +            make local-all
>> +            echo ${{ github.sha }} > Release.txt
>> +
>> +      - name: Create Draft Release
>> +        id: create_release
>> +        uses: actions/create-release@v1
>> +        env:
>> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
>> +        with:
>> +          tag_name: ${{github.ref_name}}-${{ github.repository_owner }}=
-draft-v${{ github.run_number }}
>> +          release_name: Draft ${{ github.run_number }}
>> +          draft: false
>> +          prerelease: false
>> +
>> +      - name: Upload Release Asset
>> +        uses: actions/upload-release-asset@v1
>> +        env:
>> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
>> +        with:
>> +          upload_url: ${{ steps.create_release.outputs.upload_url }}
>> +          asset_path: virtio-v1.4-wd01.pdf
>> +          asset_name: ${{github.ref_name}}-${{ github.repository_owner =
}}-draft-v${{ github.run_number }}.pdf
>> +          asset_content_type: application/pdf
>> diff --git a/.github/workflows/test.yml b/.github/workflows/test.yml
>> new file mode 100644
>> index 0000000..34f4f44
>> --- /dev/null
>> +++ b/.github/workflows/test.yml
>> @@ -0,0 +1,15 @@
>> +name: CI
>> +
>> +on: [pull_request]
>> +
>> +jobs:
>> +  build:
>> +    runs-on: ubuntu-latest
>> +    steps:
>> +      - uses: actions/checkout@v4
>> +      - uses: xu-cheng/texlive-action@v2
>> +        with:
>> +          scheme: full
>> +          run: |
>> +            apk add file make zip
>> +            make local-html
>> --=20
>> 2.47.3
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
