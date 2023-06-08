Return-Path: <virtio-comment-return-6237-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F6C7EE29
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:13:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D7A55C6108
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:13:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B37DD986674
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:13:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E80A986351; Thu,  8 Jun 2023 14:13:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B68C98666A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 14:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEAS/asZnNAV9JCZ7fLbiZnx0Vlju9/BN/eFN+jCr73QUshYeOlxUEW1CHEP/Xp1ML9upk3mUb+VHuil00ycK98/tpo8JO7iLD+lX616j/zo5njcXi8qliccSaxpcibeGbAY1EruF3zR/sqrW8nfaEFNFljdkhpvC49kQItozoIc/rdFifnk2d8BPET6edl3NnSEvjtp6fkxC5VvA7oKW9f2kSCDuidVxzvtFpZJH2LKdDWGYjA0+k2YIemx8y+ch2lJijYaf2izDgPDG0G6gjy6fPkfqOpm3cdTebdEeOlr8MvNe9YdacTRbkrF0YJbL/VXGariwD4//JR4YsKnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxeckn+OLw6vNUuqZEgZhRXLkHnMFRuadl1ZM5d4V+A=;
 b=EoXi5/MLCtjefBWV7PeBFToi8tvBQx7IEziTh0j691KMxLo4CS0lmeJUCrpDXcMVVI2+ZYz/4VnN83VZe3fqKMMBk9WhVekoEge5zOMydnKv1fIwjvX6KevyqWNKmnnyzWCKRIGaQb75rLj4YiMCHCulV06UJCmA6vId+ocpHWqQ8gt/CZFXmcul+8p4GwQV+Jvi3kv2Ft0qHN9LhBa2NMLLhWUrkXUPgsRz4ZAhvtW3Slggw7jqZ7UzWFHGNzjMLwBYjm+D0HjFuLogXF2cwOiAnxmXzLanhmUps2B3LMBQTD1xt3+iGYwxOdVl/UE6o/eznlUJQRXM8WSNvzHEAg==
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
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgABcMmA=
Date: Thu, 8 Jun 2023 14:13:34 +0000
Message-ID:
 <PH0PR12MB54819E9FB3D88B3E56171637DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
In-Reply-To:
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB5859:EE_
x-ms-office365-filtering-correlation-id: 13816009-0eac-40a8-8794-08db682a8bcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MW3Of9AVEMWxhgvjsVYzEYPf93LRc2IWXSFIBriLeo/attkY3gK0Zjk/MTUCfMbsG0iAe37TrKAW7FdBLWcTjLqMszwmnTvglKqNBta0+4yf4u4mrSxZmJTQnBf0kuymfcbLFvn3CTnaFfZTC/AwAqu/DYv9r4TGbPpcOd/pRAmWenM+UOsdCb6+FiWUZlzPKwteY42XpvCJ6+IasmxiEyVDOvOYkpvWGyi9HFQhTGK8UhOI76mPUo2/gGgq/bykEmpOJJcvBvDQFFjMTItvNZ773bt6Kp//tANQ0nQgf+bAAnfZ9jaX4ZjejHnMtiIgqFF4sW1fYzEgqP1DlBRwruTQ9hur6Um1uIaqwlo6rRFSCNpbDQK51C3AiWgAfunIhSBjcElVpJP3k3E9n5xOTLXBFtEIbNTKw2aTlRwv5U2oECKrVmzuRKpZBFRS/9+RXgJQtUDtwNzrtxIQNO4u/G+keqo4CNiHd1qD8CaV/RODO+khN8/iaiOV+ULBWIsmHj4NoEyod8sIGR1weLG3zRSIJs0in2V9/MrkrOHFYKcGYRMj5s7nQageboWM6B8cabLz905H3QSd+YumxI9l6dBIyWojVjvJpEQgNQJN+GsqJP/t/7lVzFUXPPGMIHc0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(55016003)(54906003)(478600001)(110136005)(66946007)(8936002)(316002)(8676002)(4326008)(64756008)(41300700001)(38100700002)(76116006)(66446008)(122000001)(66556008)(66476007)(6506007)(186003)(7696005)(71200400001)(26005)(9686003)(33656002)(86362001)(2906002)(7416002)(52536014)(5660300002)(38070700005)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vm02QjVsMWUzc1ZUc04yMVpHRFNBMUFrQTRsbHhra1pINGp5Rkc0MDhWRzQx?=
 =?utf-8?B?THdwR0ZhUG1UY3ZHdk1TOC9SWUFkTWRNUXkzS3RjcCt2bW5hQnVCNmpXcFAv?=
 =?utf-8?B?cDBTblhxdi9JaXRnSEFPSTdvYmpxNWU5YU9TWS9HZXgwMGtxZE14WWJWOFMv?=
 =?utf-8?B?TnIwelVGd0g4YTV0NjZxcENjVVlkOUl3bk5GeVRjVEp0Uk1lNUhOVkFVeHBI?=
 =?utf-8?B?U1d2bFM0WFluSUZwR3BMbHhhby9ZMXplUnFjRU5qWGQ4d2R0dytVZVNuelJy?=
 =?utf-8?B?ZlpaNHRmV2lmWXYxbHVtc0tOdmpQQlRkcU5NcmhLVjR0M3FxSXJrWUlkTmQy?=
 =?utf-8?B?bWdNaW1wOFpnZFR5TmdYWnV4RkFvZEJBVkM0cmN2MWVOMlkycUFXNlJ0REpv?=
 =?utf-8?B?V0pnNTAzQ2JDSHlBMmFmQ2p3dUQ3dGlnMkxBRHdxRkFLaWhIdzhZakpiQlNG?=
 =?utf-8?B?U1VvTktIam9OSU93V3FocDBhaEtpUE9VMlVaUkRwYngxYXhkUitMenMrcm9B?=
 =?utf-8?B?d0pvOVJsMWtrZHB6NVVDVWRQYTRpdHduaHlWekhnSlFKc1BDbVBpNjBMWUdQ?=
 =?utf-8?B?d1I5bjlDVU53SWNNMmRwcWx1V2tmdFhqS1FhVE54NUZSMDk5RnJLcjJmc2Vy?=
 =?utf-8?B?NkJZUGxxbkNYRkppTzdsTkxaRWhDVzh2NmZsb2Y1ZmtMTml4aE1CT3VTR2J2?=
 =?utf-8?B?cS8yV0gydjkydUpHc3VQcUV6MTZVTDN1TmtQTVBjYjZucDdYTnJDRVhzRFFy?=
 =?utf-8?B?dWtUelE2YVpoUTJkZkczOTRpRFIwY2V5akNFSlpiUWJyb0g5NGQ1c1dsaXlP?=
 =?utf-8?B?ZnQrUGRET0pOdkkxUzVhb1FneGJ2NDZSZ1QzTjFSTGZGUHhHOGE0UTZZaTdp?=
 =?utf-8?B?bmp3RWs0N0phRlVheVlNYWxmUWVUSXJnYVUrNW5qalIzN1N4S1ZkRHd0R2xv?=
 =?utf-8?B?TFhSYUlsUVNnY0Zsa2xyVEViNFk3MERlQTJ2ZmJYRFU2ZWRadUJuM2NrSjMz?=
 =?utf-8?B?S3ZNUUZnUGMySFQrajJuc2M4MEFtSDNVYTFFTWRPVFEySWZxcnlQakVOQ2Rj?=
 =?utf-8?B?c3JiMXR4cWYxZG9lRFRJaGVYbFg0M01pOGNJbW82VDhwcTlKSGdYVk5NcTd3?=
 =?utf-8?B?a0MvdU1kS0tsb0d2WXhlU3NtY0p4WWhvMGxFSHN2WUFCWW43MUdjbXRiVDN1?=
 =?utf-8?B?NEd3MHkrSUY0UTZPL1F0Vk1xNWNFK1R6bDNYTVRGYkxVMXJBdHYwY2hnNTJo?=
 =?utf-8?B?NjNtQlNVQlFkS1pjdXE2QnJMS0RjSk45VERPVkxXdnFqeEN0dTJYYVA0Vkpr?=
 =?utf-8?B?S013Rllvb1ZGNml6RS9aVUtTcGpTN2t4WXltVGhkZTRMeGlDanBwbGJOOE9M?=
 =?utf-8?B?TzVVNWVPSUtvRGYyRlVFSXRUZUxXa0xKSlE5UjNmNkE0WW5zeG9PSmNKSmc3?=
 =?utf-8?B?eG1nWndOa20wSERGYWdzSlczRytPUmlRY0R4aWFWMjNLampPTE9aUjBXNVlp?=
 =?utf-8?B?QWJQeWFZUFZpM3p5QjE0eDVXM1cyWG5hbkZ3OVh1bnpvY1hnL0Z4RndTbXNM?=
 =?utf-8?B?ZFJWazZ1ZUJOajdZL1dCN1FqNmV4S1dhR0licG1sd0dqaUg1ZFVVVStSWHJD?=
 =?utf-8?B?bDR4QTJTb0RCLzc1SkpWNHltNnh6clkrZ2dCYUxFS0UzZC9LYzI1QmVOMnVC?=
 =?utf-8?B?aWkwVjNIakx1WmpEZkptcms4eEdBcCsyOGtPRHBIN1BvZllreXlWcVY2b0dY?=
 =?utf-8?B?MlB0K1hSWVBjdEEzckxwcU9yQWJkMTJ0OS81MHVrbTIraDJrN3VIbWhmQWY0?=
 =?utf-8?B?RVVhSHBYSkpKUVJqZytnbDZmYVJuM2JCdXJVd3VzNEFaZDd5UWdJdkl5OEtW?=
 =?utf-8?B?SDdGaDNiQTZiWXVVMmxVUWdWSlpYcmZZUFJ6cjJVTVhhZUxTdWZVRlRsRmsv?=
 =?utf-8?B?emY5M2ViNU5LM3RRUmV4SmF2UnJoNEVYbzdSVlBvanMzclk4K05STk83YU4z?=
 =?utf-8?B?M2JjRFcyQWZjWFdsaGVoU0FTRzNKVTkzZG9tWG1ob0t3d2dKT3VXd3pyMFZK?=
 =?utf-8?B?ajVKNThFaG1EcjduMlV0aWl1TURBYXRMb1JJb1BDT3RUbUJSRE5EUFlnQUs1?=
 =?utf-8?Q?s96U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13816009-0eac-40a8-8794-08db682a8bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 14:13:34.5940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UV8RvrgWvUUIkOCpuDYjzYUn2a7288TLC5+A88oT2RwaJq0SlqZKQMvOp3NkTxs/R5QUVbypUv+rYg7jAEWTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5859
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

DQo+IEZyb206IEV1Z2VuaW8gUGVyZXogTWFydGluIDxlcGVyZXptYUByZWRoYXQuY29tPg0KPiBT
ZW50OiBUaHVyc2RheSwgSnVuZSA4LCAyMDIzIDQ6MzYgQU0NCg0KPiBJbiB0aGUgY2FzZSBvZiBu
ZXQsIHRoaXMgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0gc2luY2UgdGhlIHNwZWMgbWFuZGF0ZXMg
MiBpZg0KPiAhY3ZxLCAzIGlmIGN2cSBidXQgIW1xLCBhbmQgbWF4X3ZpcnRxdWV1ZV9wYWlycyoy
KzEgaWYgY3ZxIGFuZCBtcS4gdmlydGlvLWJsaw0KPiBhbHNvIGhhcyBudW1fcXVldWVzLg0KPiAN
Cm51bV9xdWV1ZXMgaXMgbWF4aW11bSBzdXBwb3J0ZWQgY291bnQsIG5vdCBlbmFibGVkIGNvdW50
Lg0KDQpfRl9SRVNFVCB3YXMgaW50cm9kdWNlZCB0byBlbmFibGUvZGlzYWJsZSB0aGUgcXVldWUg
YWZ0ZXIgRFJJVkVSX09LLCB3aGljaCBpbXBsaWVzIHRoYXQgd2UgZG9u4oCZdCBuZWVkIHlldCBh
bm90aGVyIGZlYXR1cmUgYml0Lg0KDQo+IEkndmUgYWx3YXlzIGZlbHQgdGhhdCBxdWV1ZV9lbmFi
bGUgaGFzIGJlZW4gcmVkdW5kYW50IGJlZm9yZSBxdWV1ZV9yZXNldCBmb3INCj4gdGhpcyByZWFz
b24gYWN0dWFsbHkuDQo+IA0KUXVldWVfcmVzZXQgd2FzIGJvcm4gYWZ0ZXIgcXVldWVfZW5hYmxl
IHJlZ2lzdGVyLg0KU28gYmVmb3JlIHF1ZXVlX3Jlc2V0LCBxdWV1ZV9lbmFibGUgY2Fubm90IGJl
IHJlZHVuZGFudC4NCg==

