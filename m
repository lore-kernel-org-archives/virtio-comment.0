Return-Path: <pizhenwei@bytedance.com>
Subject: Re: Re: [virtio-comment] [V2 PATCH 1/1] virtio-crypto: introduce
 akcipher service
References: <20211115074152.43427-1-helei.sig11@bytedance.com>
 <20211115074152.43427-2-helei.sig11@bytedance.com>
 <87y25ci149.fsf@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <ed465c5e-a125-0f27-184b-2e7a1e3372c3@bytedance.com>
Date: Tue, 30 Nov 2021 10:53:45 +0800
MIME-Version: 1.0
In-Reply-To: <87y25ci149.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: mst@redhat.com, arei.gonglei@huawei.com
Cc: xin.zeng@intel.com, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Lei He <helei.sig11@bytedance.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 11/26/21 1:41 AM, Cornelia Huck wrote:
> On Mon, Nov 15 2021, Lei He <helei.sig11@bytedance.com> wrote:
> 
>> Introduce akcipher (asymmetric key cipher) service type, several
>> asymmetric algorithms and relevent information:
>>    - RSA(padding algorithm, ASN.1 schema definition)
>>    - ECDSA(ECC algorithm)
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>> ---
>>   virtio-crypto.tex | 310 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 305 insertions(+), 5 deletions(-)
>>
> 
> I don't really feel qualified enough to review crypto things like this;
> is anyone else well enough versed in crypto to look at the details here?
> 
Hi, Arei & MST

Could you take a look at this patch?

-- 
zhenwei pi

