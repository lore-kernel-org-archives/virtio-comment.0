Return-Path: <helei.sig11@bytedance.com>
Message-ID: <6ae5062f-e839-23a6-d000-5b6fd82158f4@bytedance.com>
Date: Mon, 18 Jul 2022 18:10:24 +0800
MIME-Version: 1.0
Subject: Re: Re: [virtio-comment] [PATCH v4 1/1] virtio-crypto: introduce
 akcipher service
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
 <87pmj28gk4.fsf@redhat.com>
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <87pmj28gk4.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
To: Cornelia Huck <cohuck@redhat.com>, mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: helei.sig11@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On 2022/6/21 下午6:19, Cornelia Huck wrote:
> On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:
> 
>> Introduce akcipher (asymmetric key cipher) service type, several
>> asymmetric algorithms and relevent information:
>>    - RSA(padding algorithm, ASN.1 schema definition)
>>    - ECDSA(ECC algorithm)
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>> ---
>>   introduction.tex  |  18 +++
>>   virtio-crypto.tex | 351 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 363 insertions(+), 6 deletions(-)
> 
> Hm, there's currently a ballot running on v3... I assume you want the
> changes in v4 instead?
> 
> Do you want to withdraw the ballot (and re-initiate voting for v4)?
> 

Hi, Huck:
It looks like the linux kernel won't accept the ECDSA related patch at 
the moment, let's re-initiate voting for v4? Do I need to start an new 
issue on github?

Best regards,
Lei He
--
helei.sig11@bytedance.com

