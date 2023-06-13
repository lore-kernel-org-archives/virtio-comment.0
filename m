Return-Path: <virtio-comment-return-6333-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32443EB64D0
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:00:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3E62C120D4B
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:00:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13C4998657D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:00:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD65B986569; Tue, 13 Jun 2023 19:00:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7D9098656B
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 19:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY9pvX0td1BpsV7hWWJgkLXxCIYIvL355MXnq9Ukauzuj+xpny1kxW8X2d9So8RK9B8cdv/rSta5brSRktMFEOxYmlXxgW4fe1S4g2Qo6aCJnIwz8NEiSZTZWVQLNdSUSeOEvnZkkPXHYhnqGwcZx3LLgrg19Nz6wP/SkOfx9K707fSSN9D+nDGrbN03b4+9O8DiWfzhEemPbs1k1lanTTzeHDVaNZMLn4X0CQP9ejLMhnD5whm41+PGn4MbZhRPxbwDAHfXcpK7LRTX7mQZ+yq4HSY79tQj9Vhd0VVn9O8LM/udzyc5fIVxMz2DwLYBDwC8I0Vw/8yG6ep/qrZvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfJWvsVf1sB2AmXftNA3sp45ZkkvojyVjNQR4Bdf0T8=;
 b=PV5BmJPfcq/p8B+5w7L0fFyxcWcaCtezbviPn8LDZUDuN8FJI0BU5CCzOcHmNV7wMHTZ0zt+XuTOUvf8Wv2yQCjK6GCe68h5/tMkTgdLq3YzwLSebKpRiXQbAcXTGB/KpfwlvaF7pNKdCJ7hMWLrGpxGX4NPH+8AoGN4qcwokNLyFfhunXkiNeA78NEpcDWBjm4SI5KA+z1SQBAHLlXFv2xuddXA6GvwCuNhopYJkHF+dFYLGJkfLkxIXK7W9ql7BXkgpuAEwDrF8S6OuImbcJow17R65eOOIGfvcaV/212FN+vf4NK7NSvlOE7/YEvOuScLQOEyrsLhW2al9h9maA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, Gautam
 Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, Zhu
 Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, Max
 Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling
Thread-Index:
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEA==
Date: Tue, 13 Jun 2023 19:00:02 +0000
Message-ID:
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
In-Reply-To:
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB7985:EE_
x-ms-office365-filtering-correlation-id: def0fdce-aa2b-4fcc-f680-08db6c40649f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mge6CqtUGMmITC9T5IirJlBSIF9J1ju4wrpgV7vLolXF+DYkAYrl2A0At4kBbEwQqUbqslH/jI8SmM2ViDjqpPPTkyOHRKr9DzpDA0HxBMaWGdbGlrf3t0jzHszTkqDt95SqCe8CPSdzViM0EICKzTds6eRvByUgsSsPrlbDAHPf/ypzJPCOQAG0e1jNCVzD48x70xC/gw4kGhEU8Wyqg3OlEDunfOvNpsz1dvB6VIY8MQuq+DLUkgm6KNejOwsEaLZTLZR/HS5P6HodsnSsxlgTl0+bzEmnAq8sYcrn+3iRj2/Z5QvIVaEI4FyKEq1ZdtN34W3ZfZcziFVe/E+fob+GdwRZHQcKO0M//u/am4HUXF1lTnHxmC+ZfKPDx8QASWlq8SQeqNETWQNeT5qFwcusHEwWa64KCcn2fly8DUq1g1y6XrV4izUEiGwe02UZsAfPlPhIHjuLrOKVDkW5bS1BpVwi7gyAvrL4/TKGjHbg4AYgCpd0I7wb9uKi8jw4UGdRB3aoIy63v0Kx3TALn2g8g3AhGbl4IoDM5xuGrrOoBkG/NlZlacklAB8GRCfuZ3z3W8GerII43WPYW6AaC4iqnPvN1CMA1BpWUf5LpM722PR8Jy8TLcav2W5rso0gTig2VnNH/Jw5tZXJaAuk2srMXWY0XDw809OZolCKh7Jl57qt8STddO1sRWNIoqVE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(966005)(71200400001)(7696005)(478600001)(33656002)(6506007)(9686003)(83380400001)(186003)(86362001)(38100700002)(38070700005)(122000001)(55016003)(4326008)(66556008)(66446008)(66476007)(76116006)(66946007)(64756008)(316002)(8936002)(8676002)(7416002)(52536014)(5660300002)(41300700001)(2906002)(110136005)(66899021)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YllZOVE3K25zeDB3bHlTOWNRMjgxaGtyQ0lKc01adlZ2TXkxU2sreVQ4QXNk?=
 =?utf-8?B?YU9uTUdvRzJET3lHRWZJSTkzb0ptRE9ROStJZDRFU3Q3ejVpK25BNW9RYnRJ?=
 =?utf-8?B?dlFvSTNyU1VpNmNnZjR6cGxBLzZSRzIydHlkeFU4M3lMbHAzWkZrTUx6N20v?=
 =?utf-8?B?ZFdUbGxJRlR6YWtOelRTT05VTEpCRmxwMUZCbVM0NXhSVnRoelZBOHBWSk1D?=
 =?utf-8?B?RWJpZFFpTU5NT2ZoM1h3dXg5QVlNM1RFc2JCNVl2c0M3M3hqdEdWQ2VmVy9Y?=
 =?utf-8?B?UTBqUG85cGc2V0xwZGIybFpFaGFhc0p2K1ZYLzVpQUlUUExnUm5NN21YT1BB?=
 =?utf-8?B?Lzk3YTJWdUZpN1RjTVc3a21DMkxuRFQ3MGxFbkpmeVJ3UEJCc1ZpR1hIdXQ2?=
 =?utf-8?B?S3A2SFVMWHVFTlpIRDF4YVhXQjhuYTFrUDhDL2lUSUVPZ3pRVFE0SlJaWXdP?=
 =?utf-8?B?Rk11TDVydG9YZkdybWVTRmZQN2ZDZHMydW9YNUJ1aGZOWkRrMVpQNndGSEE4?=
 =?utf-8?B?eFdSNUZHR2szUUF4VDQ3SXduR2hRaEtIUEV5NnRHalZ6WG9scThBRVNCaWpl?=
 =?utf-8?B?RWhydU9LdDkwLzY4bUc3cDYyVENHTGF5V3FNbFYyS0FIYXlyZnROcjVXUUdE?=
 =?utf-8?B?MVZpTW9kNm82YUUyampEajVpOVU0OC9KaHdJRStCZHdTVll0QUJnb2VYQWFT?=
 =?utf-8?B?N3dLYW9tc0Y1UWZKNFNwV2ZRbTlzSG13WEpsVVNqanFRbEt0VWF4cUcxUEs0?=
 =?utf-8?B?cDlDVGZsUXFCamZlNjFIN0RjOTh6RHFJTFR3QXFFdU1JTko5cFE5aGU3QXdD?=
 =?utf-8?B?YUFSQXJHaDdaYzk1alJBK0NXKzhBQm44UUJXSUovcXZJUjA2VEZEalZJamxL?=
 =?utf-8?B?RGRPblZhbDBhU0RSUGE4czUrSWZ4dVdtRk1WdjU2OVVUZzR6Mmo0NGtZYUZ5?=
 =?utf-8?B?aXZNQ0R5Y2o2d0FadXEySU9KSUdrN1ZMbWpsU2QwekhWT3hZUm9YOEFvdUlR?=
 =?utf-8?B?TDhzeU5nUHRkNnpTTDVIOTN5YzBCRXpFS3JIYnM4cjdOL1hWV0gxQWxGRW55?=
 =?utf-8?B?TjROUGw2Sjdqbm5Relhob1FsdW1RUDBCQ0p0MWJnc2NCZHVObVJGWTRrUmVt?=
 =?utf-8?B?U0pQWUVYRFNaaWk0WTI4ZFVUc2pQU0trWlkzZFBKN2V6OERKemlReTV1RlJi?=
 =?utf-8?B?YmZqeit3anR1QmRNZHdaS3JGeXptY3UzS3V4VHhjM2JVd2V1cmZTQ0VGSUJm?=
 =?utf-8?B?OU9MTjlRVnBhcnJQSllldlA0SlR0bmk1cGVITU4rMVF6aXZXRzkvQ2R3clph?=
 =?utf-8?B?TC84SW5PVGdWUWNQS0tHaDUxczR6SVU4dWpaKzVEYWFlMjR6R0FRaFlDbzF1?=
 =?utf-8?B?akMyZ25YOHoxTlBDQ3czakNFN2hQUkZyT2QrSGNuOUpISzg0OGVkejFGN2dB?=
 =?utf-8?B?VzlTZk5KcDU4QTNpaWdlY3J4VkdqQndZT0ptN1gvRFFUVUI4TXBROFRtVGkw?=
 =?utf-8?B?dEJFQkRLYWVCcTk5bVZPV25HNWFqVzQzTndlaTdoRWNERVNiUkFwQTRQbXBy?=
 =?utf-8?B?VU82R09RRmZWODVuc1JrWStJRUJDeE9xbUpEd3d6NnhLMWZ3YVBFVDVMOTEv?=
 =?utf-8?B?TTVBbkdMaUZNbmNybytaaWZ0Nk8xK0c5Mml2SE9NT0xjSG8rem94NGJheDI1?=
 =?utf-8?B?aVBQY00vSFJpeDNENjJzOTU3MHpqeUR0R2RDcVNOWDNEa3hQZFRTTmJ0bHpv?=
 =?utf-8?B?T2tVaDZvT0tUc0lmbUFiTGdMU2ZzZm51UUQwV0xwSHc0bDVKK2lIbWIyVWhB?=
 =?utf-8?B?SFRScVJRU3ltTGR3aWZwK3pOb1RISHhjTkRDZzI3ZWZSeDRHUGdGRXphQTdX?=
 =?utf-8?B?WFJ5VDJYS2RKMzRyNFd1Q2lRQjQ4YXJuaENycXRsOFR1OXRQS3ZiTmNHWFkz?=
 =?utf-8?B?TGpuak5XUHhhNGZNTE9JSEdUM3UrOVIrOE1TcEZQTElub0N6cFV3SXQrMVhT?=
 =?utf-8?B?TmM3emJ3UWtzcm9GRzdvYWlCeXBzSlE0MHYrK3JhZUFDSkFPVmdpbGlDT1Fz?=
 =?utf-8?B?aWQvYzVaMG5ZU2lySmthQ1orRnBjVHVnazRoNDBuUGkwSnEyQU1PU3RKM3FY?=
 =?utf-8?B?SVU4bUdJN2RkOFFkdHp3SnFZQml4RUFUUFVJNUtDT2c3Uzh2L24ySGN3S0xU?=
 =?utf-8?Q?V5Cmhnb236sd1TzGHAQ5cOU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def0fdce-aa2b-4fcc-f680-08db6c40649f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 19:00:02.4915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bBCysFmPfJMgliEr5gSeaknjdGv8jb97wzj99ZscXsJKqxpqR6wKrt3wfumtXfPWB8/LMC2uqFMQcoJHqEDcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

DQo+IEZyb206IEV1Z2VuaW8gUGVyZXogTWFydGluIDxlcGVyZXptYUByZWRoYXQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBKdW5lIDEzLCAyMDIzIDY6MTMgQU0NCg0KPiA+IC0gZW5hYmxlIGFsbCBx
dWV1ZXMgYmVmb3JlIERSSVZFUl9PSw0KPiA+IC0gcmVzZXQgYWxsIGRhdGEgcXVldWVzIGJlZm9y
ZSBEUklWRVJfT0sNCj4gPiAtIERSSVZFUl9PSw0KPiA+IC0gQ1ZRIGNvbW1hbmRzDQo+ID4gLSBy
ZS1lbmFibGUgZGF0YSBxdWV1ZXMNCj4gPg0KPiA+DQo+ID4gTm8/DQo+ID4NCj4gDQo+IElmIGl0
IGlzIHZhbGlkIHRvIHdyaXRlIHRvIHF1ZXVlX3Jlc2V0IGJlZm9yZSBEUklWRVJfT0ssIHRoZW4g
c3VyZS4gSSBhc2tlZCBmb3INCj4gdGhhdCBpbiB0aGUgcGFzdCBhdCBodHRwczovL2xpc3RzLm9h
c2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby0NCj4gZGV2LzIwMjMwNS9tc2cwMDMyOS5odG1s
DQo+IC4NCg0KQmVmb3JlIERSSVZFUl9PSyBzdGFnZSwgcXVldWVfZW5hYmxlIGlzIGFscmVhZHkg
YXZhaWxhYmxlIHNvIHdoeSB0byB1c2UgcXVldWUgcmVzZXQ/DQpUaGV5IGhhdmUgZHVwbGljYXRl
IGZ1bmN0aW9uYWxpdHksIGhlbmNlIHRoZXJlIGlzIG5vIG1vdGl2YXRpb24gdG8gc3VwcG9ydCBx
dWV1ZV9yZXNldCBiZWZvcmUgRFJJVkVSX09LIHN0YWdlPw0KDQpJdCBpcyBub3QgZXhwbGljaXRs
eSBtZW50aW9uZWQgaW4gdGhlIHNwZWMgdGhhdCBvbmUgY2FuIHNldHVwIHRoZSBxdWV1ZSB1c2lu
ZyBxdWV1ZSByZXNldCBpbnN0ZWFkIG9mIHF1ZXVlIGVuYWJsZS4NCkFzIEphc29uIG1lbnRpb25l
ZCBpdCBpcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYywgb25lIGRldmljZSBzdXBwb3J0cyBpdCBh
bmQgb25lIGRvZXNuJ3QuDQpIZW5jZSwgaXQgd2lsbCBicmVhayBvbiB0aG9zZSBkZXZpY2VzIHdo
aWNoIGRvZXNudCBzdXBwb3J0IGl0Lg0KDQpUaGVyZWZvcmUsIEkgd291bGQgbGlrZSB0byBhZGQg
aXQgdG8gdGhlIHNwZWMuDQoicXVldWVfcmVzZXQgcmVnaXN0ZXIgTVVTVCBiZSBhY2Nlc3NlZCBi
eSB0aGUgZHJpdmVyIG9ubHkgYWZ0ZXIgZGV2aWNlIGhhcyByZWFjaGVkIHRoZSBEUklWRVJfT0sg
c3RhZ2UuIg0KDQo+IA0KPiA+DQo+ID4NCj4gPiA+IC0tDQo+ID4gPiBNU1QNCj4gPg0KPiA+DQo+
ID4gVGhpcyBwdWJsaWNseSBhcmNoaXZlZCBsaXN0IG9mZmVycyBhIG1lYW5zIHRvIHByb3ZpZGUg
aW5wdXQgdG8gdGhlDQo+ID4gT0FTSVMgVmlydHVhbCBJL08gRGV2aWNlIChWSVJUSU8pIFRDLg0K
PiA+DQo+ID4gSW4gb3JkZXIgdG8gdmVyaWZ5IHVzZXIgY29uc2VudCB0byB0aGUgRmVlZGJhY2sg
TGljZW5zZSB0ZXJtcyBhbmQgdG8NCj4gPiBtaW5pbWl6ZSBzcGFtIGluIHRoZSBsaXN0IGFyY2hp
dmUsIHN1YnNjcmlwdGlvbiBpcyByZXF1aXJlZCBiZWZvcmUNCj4gPiBwb3N0aW5nLg0KPiA+DQo+
ID4gU3Vic2NyaWJlOiB2aXJ0aW8tY29tbWVudC1zdWJzY3JpYmVAbGlzdHMub2FzaXMtb3Blbi5v
cmcNCj4gPiBVbnN1YnNjcmliZTogdmlydGlvLWNvbW1lbnQtdW5zdWJzY3JpYmVAbGlzdHMub2Fz
aXMtb3Blbi5vcmcNCj4gPiBMaXN0IGhlbHA6IHZpcnRpby1jb21tZW50LWhlbHBAbGlzdHMub2Fz
aXMtb3Blbi5vcmcNCj4gPiBMaXN0IGFyY2hpdmU6IGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5v
cmcvYXJjaGl2ZXMvdmlydGlvLWNvbW1lbnQvDQo+ID4gRmVlZGJhY2sgTGljZW5zZToNCj4gPiBo
dHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy93aG8vaXByL2ZlZWRiYWNrX2xpY2Vuc2UucGRmDQo+
ID4gTGlzdCBHdWlkZWxpbmVzOg0KPiA+IGh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL3BvbGlj
aWVzLWd1aWRlbGluZXMvbWFpbGluZy1saXN0cw0KPiA+IENvbW1pdHRlZTogaHR0cHM6Ly93d3cu
b2FzaXMtb3Blbi5vcmcvY29tbWl0dGVlcy92aXJ0aW8vDQo+ID4gSm9pbiBPQVNJUzogaHR0cHM6
Ly93d3cub2FzaXMtb3Blbi5vcmcvam9pbi8NCj4gPg0KDQo=

