Return-Path: <gaetan.harter@opensynergy.com>
Subject: Re: [virtio-comment] [PATCH 3/3] virtio-crypto: fix missing verb
References: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
 <20210726163850.201851-4-gaetan.harter@opensynergy.com>
 <87o8an50jx.fsf@redhat.com>
From: =?UTF-8?Q?Ga=c3=abtan_Harter?= <gaetan.harter@opensynergy.com>
Message-ID: <0b488f1a-336d-59bd-fc9d-959061d6200b@opensynergy.com>
Date: Tue, 27 Jul 2021 16:41:28 +0200
In-Reply-To: <87o8an50jx.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 27.07.21 15:49, Cornelia Huck wrote

> On Mon, Jul 26 2021, Gaetan Harter <gaetan.harter@opensynergy.com> wrote:
>> The condition was incomplete "guarantee the size IS within the max_len".
>>
>> Signed-off-by: Gaetan Harter <gaetan.harter@opensynergy.com>
>> ---
>>   virtio-crypto.tex | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
>> index 4a15e14..0d1d832 100644
>> --- a/virtio-crypto.tex
>> +++ b/virtio-crypto.tex
>> @@ -275,13 +275,13 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Crypto Device
>>   \item The driver MUST read the detailed algorithms fields based on \fi=
eld{crypto_services} field.
>>   \item The driver SHOULD read \field{max_size} to discover the maximum =
size of the variable-length
>>       parameters of data operation of the crypto request's content the d=
evice supports and MUST
>> -    guarantee the size of each crypto request's content within the \fie=
ld{max_size}, otherwise
>> +    guarantee the size of each crypto request's content is within the \=
field{max_size}, otherwise
>>       the request will fail and the driver MUST reset the device.
>>   \item The driver SHOULD read \field{max_cipher_key_len} to discover th=
e maximum length of cipher key
>> -    the device supports and MUST guarantee the \field{key_len} (CIPHER =
service or AEAD service) within
>> +    the device supports and MUST guarantee the \field{key_len} (CIPHER =
service or AEAD service) is within
>>       the \field{max_cipher_key_len} of the device configuration, otherw=
ise the request will fail.
>>   \item The driver SHOULD read \field{max_auth_key_len} to discover the =
maximum length of authenticated
>> -    key the device supports and MUST guarantee the \field{auth_key_len}=
 (MAC service) within the
>> +    key the device supports and MUST guarantee the \field{auth_key_len}=
 (MAC service) is within the
>>       \field{max_auth_key_len} of the device configuration, otherwise th=
e request will fail.
>>   \end{itemize*}
> This still seems a bit awkward. I'd make that either "MUST guarantee
> (...) to be within (...)", or "MUST guarantee that (...) is within
> (...)". What do you think?
> auie

I agree

 From a non native English speaker, I think I prefer your second version ba=
sed on
the current text.  I read the sentence as an active process "read to discov=
er,
and guarantee, otherwise the request will fail" and it is easier for me.
Where I feel the first one, with "to be" to be more a static.

I will send an updated version.

Thank you.

Best regards

--
Ga=C3=ABtan


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>

