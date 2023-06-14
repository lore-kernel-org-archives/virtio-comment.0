Return-Path: <virtio-comment-return-6351-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5182EB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:32:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C0EA79124
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:32:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC0EC986665
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:32:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D8144986656; Wed, 14 Jun 2023 04:32:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C50E698665C
	for <virtio-comment@lists.oasis-open.org>; Wed, 14 Jun 2023 04:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRdW3SLgKI2rLiHHT5vpMX5srJMB3GJjQA347HfeXz0rMJRwH3B+1gCWRlMqpNgIsehZcZMZ0GXMoVfsQsXYLPqaiJfCT3ZIRQ28lYgax9htoWmiXJ22ux64UvFVxTud4JrkJu2F3WkmSRL93jkPd4EL2xt/0JMJ9wBgaGtCU43J8Ybs+DWDveIhq55oVZVB/jPgDmuzzK1qAx8wAsfcqoAyqiLrKHR4yyEJL5Mc6nATu3DmLiLVSaNMsL7Tzeo905CQ2ROCuSn335UWw56vkvqWaLd20awmgnBTwYT4uFxOVxFHMhbfkJ2HhBKYAGdilQwabrFNVWw7/1+pI/ZlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR7a6tS7LCV0TVAJnk53b/5z6KUzYDH2ijJAmkXLIO8=;
 b=MF3AaX+7o/p1u2ANwqGkl+bygWVGV0OsvzCFv6iu0Ppew7oR2IZ1OF2n6+8sMdF4Pr+3J+FASk1Hlhl42vTNPrb7z36V5ymtjLg9A46LyLPiXFeHrl69EwYvRhCM2wvwGgYOTVJDg7QJrcmTI1YP3HwrUu0hMUU1Rllsqgt/cW0No5AW5IyHFbvvU2EKa7EO80FnT+ycBsi/X8UlPeOsCgAVcECJqoVkJv5vQlE1ZcDpvF2/6HJHk1IoAIcC08bgIaF2DGP/wOqj6lYMXZ/NlXW7VI3I5RB/hVK+6s3GXNhf8SwBMr2JTfWwbNjd6mFV5qjJaxK12A02QhFk36apjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, Gautam
 Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, Shannon
 Nelson <snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling
Thread-Index:
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEIAAEOUAgAATmKCAAAwbgIAAALkggABulQCAAAB4QA==
Date: Wed, 14 Jun 2023 04:32:39 +0000
Message-ID:
 <PH0PR12MB548104F31CA38275A2D7E41EDC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613173837-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CBCA2D51F3B67581C100DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c78d5554-ac1b-ed67-01d0-00943e69af44@intel.com>
In-Reply-To: <c78d5554-ac1b-ed67-01d0-00943e69af44@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6186:EE_
x-ms-office365-filtering-correlation-id: ab5bf251-4228-4643-15a7-08db6c9062ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y5AfA/OUB/Jo9J8inWImgOr55zQgEWxidx/27tEDu6sUmx5tjT9fvDo0Cy+MLGpRRIKgfz+biytT9B/8rfrhrMXO4g7NxkGv5AS3XhtHMVTX7ZFvYgwUwDvjIpXGNSrPk4Cta1kIw6LIbobMNTkRZb8XHDwfqeIoME7sNNDpjRCTWB2w9tKsbolTMeDe/ayF2roA6Iln5uSG36hM+bO/QN1R46JflNTKUFb+peN4Cwfs1o/Bu94YwOWv1kVSF/S9Re61ztI0uBxx3FG2Sgs7jHNhpq22gVJh1Nx1THqg8RBR6dLmDab7RXwpzVOAYrPxcHVxwzSpgAHGhB5MUPi+ON7GuUUYSSnsKugDZbguwE3a4py+Tomx0smrcrVN37+KtU3NGdN9pnQtIaYBHwX2H343tLQr0i351D8fNvR9h2RcMunkFBwzyeT9vFj6/ctjKf53Hz/r7l/fgFLw8tC3zmvX5fmCmy+zWkPIwTqtUYwiF/IAM6dYEQKTUGEbu/5ZcqPUtzu4324DA2NlCvi+ESHcaRwz+eJn40jbHGjNbotfoDIQcWvBiDUs8EWXI+E415+RGI+St0sk0xmAahAYJSy6fpl7fRNuOmSNFanHdcXzINARadqqw8iN4yFg9vWH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(55016003)(110136005)(54906003)(122000001)(478600001)(71200400001)(41300700001)(8936002)(8676002)(5660300002)(4326008)(76116006)(66946007)(66556008)(66446008)(64756008)(66476007)(316002)(38100700002)(186003)(7696005)(9686003)(6506007)(26005)(52536014)(86362001)(33656002)(7416002)(38070700005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tm1Bcm1yU3pQV2YzS3BhbXBMNTRYWDUxUXlxUVV5dG9Za0ZBcDF3QWhOcVpp?=
 =?utf-8?B?L3I0U0tQc3R0enlVSjZKWjkvMjFVQXZVWEhmR1p4bFdlZTVvTFBDNGVhWFJM?=
 =?utf-8?B?Yzl0VzBTTlNHSmFwVkZzbjBKUzkyd0hiK0krcFcyTVhFZTl4Q25DWmxtbFF4?=
 =?utf-8?B?UUVWSWJnUkdIMXloeE1sTndJUVBNVWRGaVhaZkJhR2pKOWVzaXErVlRvSjhj?=
 =?utf-8?B?VXZMbFZUcHM4MlAxdVZEcmpodDQ0T0ZYL0FjVmhUTnZlUyt4M3kyYWtmQmxK?=
 =?utf-8?B?ZUwrbVZsT3ZiOGwvQjZDeWxncUNRaHJqTmd6T0tEK2M0Q3drQURsaEVpN0tR?=
 =?utf-8?B?ajNHSkduVHJ5Z2dwTGxCQzd1UUtWV0lqN1R4YUNRUFVJQ1FGOVZlRUJpV05p?=
 =?utf-8?B?UmpITlF6SmdsUzgwdDBmVEloMmhCS25QbDN2bVVLRnkrS0NDRlBmWCtGZGI2?=
 =?utf-8?B?THJ4NElpMFdrcmF1eGlVRllHdlhSSklJUUt5cndEWUFKS3FrNWxhU2d0d2Fi?=
 =?utf-8?B?bjg0VG5UdkRNRkgwb2tQcExaeDZPcDBDeFNxOGxVc3ZRUWN1aTV1eDE3NlNU?=
 =?utf-8?B?L3pvbWFFTGVOWTVtRGxqUCtqamdZc1poMHhaRktESzhNcFlLQ3lQSlJweENH?=
 =?utf-8?B?bEEyWG13QW9leVlnWCs4K0plTlJzaC9EMHdvaXljeGM1V3RiTFFuSmJxa3hP?=
 =?utf-8?B?ZGhxdSs2Q2NPTG5hbG1lME9maTFSWkZJcWtXeENlY0ZlaDVoS2NUWlhCQXRm?=
 =?utf-8?B?R3g4Sk16NXdmMVkxZmYrMElwcVNuaEFUUGdVbkJHUkpXbUJ5aWhYclpEWjdW?=
 =?utf-8?B?dzkyLzIvOU9MZ1p0VDhyYzZ6dlYvRkQ1ci9OWkIzeGFycWFCd0lwTUFQK2wy?=
 =?utf-8?B?TzRieTdwS1B6dGhXVnR4eDRsWU0zZFZDQmd1cmpmeEVjbFE4eGxGZTJ4N1JR?=
 =?utf-8?B?V2JCMUllNzZuZUM1THhiaWorWGY3R2l3WkN0RjVSTC8xQ2Exdml5THdPT2pN?=
 =?utf-8?B?VjhPQ3QxZ3ZRY0hFY3IySEh0SEVoTVlKQTZiOE43Znh6dVhMdW16amNncVBn?=
 =?utf-8?B?bGd0aGl0MXVwaFJkWDFqejBMUDBQeGZKSDZVWXE4ckJvNW9ONndIazBLWlNj?=
 =?utf-8?B?aytrdEpjUDFmZjI4Y2puWVd6VVg1aDlVeXk2d3lMQW8rdVJyd2pDMVNiNmtG?=
 =?utf-8?B?SjRjTjZuZ3RZTUl5dVVXVTNuMTJCSzFMaHVYMXVYOFlUbHFOSkdFS0I0NXFT?=
 =?utf-8?B?VDdOMk9RSVlPY1duQUxQK0wwQVUxV1BxajNzRzRtUlo0WlBoT0RMMGhNU1lD?=
 =?utf-8?B?L2RES1QxRkU5L2ZIam54OEdBTndSeWsvcXZnajFNNldvaVBGWEYvTkMvVWVm?=
 =?utf-8?B?Zk9GQzIwelFEL2d2UzY1YTBMeTh1emJiMHdwdFErMStWTTl1czdzZ0Z5YmJ3?=
 =?utf-8?B?OFdBZlRhYzBlTVR4MzBlNDBrajQ3V2RZeU05MmxhYTZsaXZka1BReE1sVk90?=
 =?utf-8?B?WC9PSThvUnZmVCtqcldtQzR2eEl2UHREb2p0UHVHYW8vUkRyRVJBd014ZjJP?=
 =?utf-8?B?MElBNWtIR0dBYlZTellTSmx4MjJuNS9ZYzlydWxWdSs0aWdjam04RkpDVEp6?=
 =?utf-8?B?MnY1RFkrZUNWanFDMTNKM0l4OVBTc1ZkTHVzcVVmM1BBRHA5RDg1S2ZIbkNV?=
 =?utf-8?B?bTJsY2lmZkhOcDN1ZzlRdDQ5Sk5Sejc5TldsK0pML2RHYm1BRytwOXpyTmt5?=
 =?utf-8?B?OE5nM3FqcTM0QnRmWTlOUFF1WGpqYXUxcDNzMGIxU3hyeHFTU3NjamFkWno5?=
 =?utf-8?B?eGp6R3IyRjlMdDNrd1cwRyt4RFBOQWo0K2cwYzh0RFpGS09Za2VGakJJbVZB?=
 =?utf-8?B?TFRPbGVUeWMyWnVUb054TENXNFVGYU9TdEplK0VQWDJ1UldjdEhObzRWOHNT?=
 =?utf-8?B?a3hZaXhvQld1TFVleExhSkx5MFF6MmlHQkNZQzN1ZU5NbFVCc3hUZGRtM0x2?=
 =?utf-8?B?T3FIOER0Y1ZCdnNTM0Jrd2xNc3FvYXhDZGw5TjZPeUdERTZaSEJLQmRQYU9D?=
 =?utf-8?B?ay9vZ1ZQS2dESmg5ZTNEMC8xODJoT05mS1l2eGkveTBIbGxDYmlnM0I3Z3hk?=
 =?utf-8?Q?jKW8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5bf251-4228-4643-15a7-08db6c9062ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 04:32:39.3409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SF9BcKfbzzHrNBQfmTd+PFPrDSLmrX5E7bdQLYYqLsVqkYhn5fIp/FE7xWfuFKJ+BVKjl1yQq+v6Bcy40qdWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDE0LCAyMDIzIDEyOjI3IEFNDQoNCj4gPiBJZiBhIGRldmljZSBo
YXMgYXNzdW1lZCB0aGF0IHF1ZXVlX3Jlc2V0IG11c3QgYmUgZG9uZSBhZnRlciBEUklWRVJfT0sN
Cj4gPiBzdGFnZSBiZWNhdXNlIHVudGlsIHRoYXQgcG9pbnQgdGhlIGRldmljZSBpcyBub3QgImxp
dmUiLCBTdWNoIGRldmljZSBuZWVkcyB0aGUNCj4gZml4Lg0KPiBJIHRoaW5rIHF1ZXVlX3Jlc2V0
IGp1c3QgcmVzZXRzIHRoZSBxdWV1ZSBhbmQgaXRzIGZpZWxkcyBpbmNsdWRpbmcgdGhlDQo+IHF1
ZXVlX2VuYWJsZS4gRFJJVkVSX09LIGlzIG5vdCBhIG11c3QgZm9yIHBlcmZvcm1pbmcgYSBxdWV1
ZV9yZXNldCwgTXkNCj4gdW5kZXJzdGFuZGluZyBpczoNCj4gLSBiZWZvcmUgRFJJVkVSX09LLCB0
aGUgZHJpdmVyIGNhbiByZS1jb25maWcgdGhlIHF1ZXVlIGFueXRpbWUsIGRvZXNuJ3QgbmVlZA0K
PiBhIHJlc2V0X3F1ZXVlDQoNCkJlZm9yZSBEUklWRVJfT0sgc3RhZ2UsIHRvIHJlY29uZmlndXJl
IGEgcXVldWUsIGRyaXZlciBuZWVkcyB0byB3cml0ZSBxdWV1ZV9lbmFibGUgPSAwLg0KVGhpcyBp
cyBub3QgYWxsb3dlZCBpbiB0aGUgc3BlYy4NClNvIGRyaXZlciBuZWVkIHRvIHVzZSBxdWV1ZV9y
ZXNldCB0byByZWNvbmZpZ3VyZS4NCg0KPiAtIGFmdGVyIERSSVZFUl9PSywgdGhlIGRyaXZlciBo
YXMgdG8gcmVzZXQgdGhlIHF1ZXVlIHRvIHJlLWNvbmZpZyB0aGUgcXVldWUuDQo+IEJlY2F1c2Ug
YSBxdWV1ZSBpcyBjb25zaWRlcmVkIGFsaXZlIHdoZW4gYm90aCBEUklWRVJfT0sgJiYgcXVldWVf
ZW5hYmxlLA0KPiBhbmQgcmVzZXR0aW5nIGEgcXVldWUgYWxzbyBzZXQgcXVldWVfZW5hYmxlIHRv
IHplcm8uDQo+IA0KPiBBdCB0aGUgZW5kIG9mIHRoZSBtaWdyYXRpb24sIGh5cGVydmlzb3Igc2hv
dWxkIHJlc2V0IHRoZSBxdWV1ZXMgYW5kIGNvbmZpZyB0aGUNCj4gcXVldWVzIHdpdGggdGhlIGd1
ZXN0IGNvbmZpZ3VyYXRpb25zIGFuZCBlbmFibGUgdGhlIHF1ZXVlcywgcmlnaHQ/DQoNClRoZSBt
aWdyYXRpb24gZm9yIG5vbiB2ZHBhIHdvcmxkIHdvdWxkIG5vdCByZXF1aXJlIGFueSBvZiB0aGUg
cXVldWUgZW5hYmxlL2Rpc2FibGUgZmxvdyBiZWNhdXNlIGRldmljZSBpcyBtaWdyYXRlZCAocGF1
c2VkKSB3aXRoIGl0cyBjdXJyZW50IHN0YXRlLg0KQW5kIGl0IGNhbiByZXN1bWUgZnJvbSB3aGVy
ZSBpdCBsZWZ0IG9mZi4NCg==

