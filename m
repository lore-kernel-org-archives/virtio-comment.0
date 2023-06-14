Return-Path: <virtio-comment-return-6353-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5839EB64D9
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D2C29190902
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BBAC69866A3
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A8E8498668E; Wed, 14 Jun 2023 11:56:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95AAC98669B
	for <virtio-comment@lists.oasis-open.org>; Wed, 14 Jun 2023 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfx8X6XLWNiBHv09Ove62YCT9o71/7CtEK0vuZoZTo2F+9TPjuKctnVikeCqZomn9fWF5fSbb56tYITHX+mOI+dUafWFJsgx+MFzQ5y8Biw8Su61Enqh97cGicc+dG/cvbDavcWeJ3R/9MybuxsAJN0Ze0B5zUSxOOZ4WTkgHjYq1C/GukKT9LuO8thEecjHfEOUQWdLu3ZziFEFaMIHcrp3aXgRHaqMDljH/eJCuHdMyAcxkakG8XOQ+PL+kUcmvHNX3lHR8sV35DWyE9d8xU9nllt7+1e7neB1dh49/SMDg5C8u8qDQKa43w9eEE6Saz/Snhfu096a+HH8XusNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFS0v2x1+h3PY+O8OT5m/PMeaVGUtD5DGvGNMiI7ia4=;
 b=NtCEUO3dbWlNDMm++/ERQ+javNwo9R1J6c7dPadhvMj3wn2y142cs01AS+vsd0LHPPCs/X+wn/N2VrWbhwsvLcA3msEh8HPpR1nTjbP6YGs7q69DXW7ViuMdGYTR9g3thVZJG9ioDXSSnXiFU2FgGDIPhI0Uf2dW+Zp+AdwR6fNxujHN4+ZiC+l9zqaoTRd4qPlLHRAeGuC5YpDug+N4TWB4j6dzMw8PcOfopVkrXrrYeXV2DfkIe2y5C7UY5ZbUjvXZUXZmLDE9hg/Lf9/7MhuimsH883Gbdh7i/8f58ozDD+zyY6h8miLSgjk2W6HYL3mPXXzG9A1L7ByXaRijjg==
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
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEIAAEOUAgAATmKCAAAwbgIAAALkggABulQCAAAB4QIAAHMsAgABfD9A=
Date: Wed, 14 Jun 2023 11:56:24 +0000
Message-ID:
 <PH0PR12MB548153E61A5C67902F427746DC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <PH0PR12MB548104F31CA38275A2D7E41EDC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <476b3ec4-0a19-2f61-4d2a-e4badfbeb499@intel.com>
In-Reply-To: <476b3ec4-0a19-2f61-4d2a-e4badfbeb499@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB9062:EE_
x-ms-office365-filtering-correlation-id: 48ee0dce-5df7-42ea-a3be-08db6cce60d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aGf/PXpNvYN2Cii9rESotdR8SbPh/BFghpY/sKzacLi6sl0lnkMs721WAUYeTk3dSsiMAOjcR12ak41kASsRBWmJ1+suf7TaGktNL0bLbevTbkdh3ogjs+PC+7Gl6h1PjAndXAa66XGHsMVqhxmyxN1g45KF5dap1bfOINJn8f7IP7yzYKyuezRu/be8wkBrHH/ssNbvvJuEr2pz5/T1lSEnLPZcKsYxIFXDSCtKY/QwGjkDaq3cOMo8sQXHXeKOdIyHpVl4RIlDy5JMN6tOfyETr0ehbV7QGQVw3vqHKQT0TOq2zu5Svuvnrin3PucowMH/rqZ6pZer9GtWVRErWw44zFBJtRW9Jl0xUhXzoeOjzlClSzVUz840XfPdyB7TS3b5nRlL0+WrFhlUvvxhLFj6gQVciRPKO25IZSAVgaLc03JKMnSkDONmUIfNi/ijW81RJSozxY2DrGFVY28gABFWE4Fy/zX/3r/RyU88NjiWfp0KDxJCFU3JrSS9AQ6i698T7PGUWUpTBip8xjvwQ4V/B32JzFO7PYfK0tiSbD16N4mBl2qaVKvmsxVrxhEXlGOBaj9EQfG83MLBEJzn8SFrEwO2uo+0XP8V2cU0J2N7f/FBSEYI3UWccOwkLwRw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(66476007)(55016003)(110136005)(478600001)(54906003)(38100700002)(76116006)(66946007)(66446008)(64756008)(8936002)(316002)(8676002)(4326008)(66556008)(41300700001)(71200400001)(186003)(7696005)(6506007)(9686003)(53546011)(26005)(122000001)(86362001)(52536014)(5660300002)(33656002)(2906002)(38070700005)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGZKK1RyT2xuUHdXTEwrUGo3OStsdmNOd2JYU3kzYld0Q3RqMUJ4MS8zY0Vr?=
 =?utf-8?B?eDd0NFBzOE9NZTVjZVVJWDVvQ1VQNkNEUFFvekMvdUo1bTNVZUZwRlMvc3pt?=
 =?utf-8?B?ZEJIcjJKMzlkcWpUL2VtWmNkY21OLzVJbk5BdFoyL3Z1emxLeFpOZ3JBZ094?=
 =?utf-8?B?TkMxRDRhcVdHMWw1Yktzc1JpZ09ZeGVIOWJFaGV0akNwb2tTUGEwT0VWSVhC?=
 =?utf-8?B?aU1BUkpQejlTa1VIcnJVMzk0RzBTd2Y0RXBybEUrYlZBdTZpVE5NQVFYdUsy?=
 =?utf-8?B?Y1VFS2ZDNkRuMCtnR1Z5angzZkVxOEorWEs4eWphSllESHo5cllickhBOTRp?=
 =?utf-8?B?OGI3RHFJbDZHeHlHbUF6eFlTQjhsZGNMWUJlWHZVZDNBeFg4WHFHMG5MSUJ4?=
 =?utf-8?B?RVR5TFBvQlZ2ckRwYkU4YThmZGY3Mk1IaG9FeU1PajI5R0dDWHdzU2hDS08w?=
 =?utf-8?B?VEkvdkJlRmZ5MlFKam11eHBsaDY0K21KbTVkcWg1WEQzRzQ2QVZKT2hzQ3ZK?=
 =?utf-8?B?cUdkb3VXeEZxZFQ1UWpGcHE3VHdwaEtXTnViN2JHemVrdmJscHo0RzRWNXJv?=
 =?utf-8?B?RVFXOFpKZWZuMXVOdmhDTzFxbktEWTZaOFA4QkQ4ell6R2xYT1ZFb2QwV00x?=
 =?utf-8?B?NTFnVzI4SzVNbmVISC8vQWxhSE1PZlJBZldHVytxbHNUMHowVEt2eEUvZGds?=
 =?utf-8?B?VEtWZWlRaVdQUUtjRVZCUzlXc2JNRGpvaFFZUVUybnVSWWhCRTNvRnlGb3Uz?=
 =?utf-8?B?YllRa0JTMjgzeDhybU1OUUIvKzR2enE0eG5HM2pma0FrZmE2S3Z4QVlpNzh6?=
 =?utf-8?B?VHBCZ1Z4Y28xeFJuSFpvSU95UUg5aDBTVGw5Y1o4L1ZSbDMvWEFKV1FiVjI3?=
 =?utf-8?B?OC9sckNtVmtib0ViNkkrZnZZc1lSQkRzTlJ5WWpTcjl0eENYS0dNdWtnRUNm?=
 =?utf-8?B?UU9yaitBVzZFeHp4ci9nUUVLMjJtYUx1VDVwaGY3RUZCcFFQZ3J1ZkcrRGRs?=
 =?utf-8?B?cENNYzNtU3h0SUttQkVNOG9vdU90RWdlNldUVTIwT005WVBDenFqV1hBcXU3?=
 =?utf-8?B?RndjaDdMVVM2K1JweElOMmdPdjRKY3QzcEswdXJtVWppNVlERyt5bmlwQjRO?=
 =?utf-8?B?OTZyNWdERnhnT2dWNENVWjkyVDBQbnVoLzFuSXVHdzJGQWZoT2RIemNjN0dv?=
 =?utf-8?B?UFZ6RTZLNzBZeFMrNG5Wd0xkeTBWWlpLN0dNTDJQbXJPRGluOExudlEwQm1M?=
 =?utf-8?B?NEllZDZhK2M5aWRiOUdHSjZOellrb2t5d0NGOXZQRXk1RE1NZnhQL0JRVHJu?=
 =?utf-8?B?SjdVeDNrblBrcVNkd0laK1dOblZQcDFjcUdGZHNxd3NQbDFRclljYWhCTHp4?=
 =?utf-8?B?eUZoY0dhZ0dsb0xvQzI3QTQrZ3kxOGNDelNKUE1ucnFFOXNFU1Voc2JhdEFa?=
 =?utf-8?B?cCt5ZkpsbDhsSk9zaUhJVWFpeVc4bFdUdGx1eXdCNGFqY2hFdTZUMEZZQWlE?=
 =?utf-8?B?ckxJdGNCdzdkTXFVUEVSajZGTVFNSURoVkNMdy8zL3VPSUpzWWNCd3pwa0Fj?=
 =?utf-8?B?VStacFBFclJFQW1kaW9ubDFLTjltUWRwMWxMRG5OKzNTS0ZjQlkwVTVacGpi?=
 =?utf-8?B?aGZYUVJFR3p0OXBETldXcFJEdUZYckUzWHJ3KytIQUNoN1MwMFluRXJaRDJH?=
 =?utf-8?B?NmFFb3RYYm16dGVrWXVJOSsrWTJ1Zk0weDRtamRPenEvSXhNbXFpNzZ1RHI4?=
 =?utf-8?B?OW05WXhzT2F4N3RkdngybVFMK01sbFY0OElWOEF0ZVVRZTdaSm5BdkpHajM5?=
 =?utf-8?B?RUJteEdidS9WM1BIeHIzQ0tsaHg2a0xjdnd1dVZVMVBQbnZ5ZjYveDYrZldq?=
 =?utf-8?B?OGc5QVA2VnVtem1EZ1JXaHdWNTgzdElOUThyYVBybnRwOHUyby8rb3ovVFRa?=
 =?utf-8?B?UURsOVhUeElQNUUrL1VkR1M5RVhGRkVSVWY2OWdXeDBCUVJ5Rk9CaDB1U0Ex?=
 =?utf-8?B?SmdsRzFBaXZIaWt1d1JZREFIcXpraTdTZzRuS3dTRmlqVk1Sb2RwVWgyb1Iz?=
 =?utf-8?B?bncxQWlHbUxYeS9EWFNLVmZWU1lFeG5jbEJCc0ppRDRxNkhzN251TDZxeHZp?=
 =?utf-8?Q?pxPQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ee0dce-5df7-42ea-a3be-08db6cce60d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 11:56:24.6049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFHu3sNJFwDywfiIWsKd4/ywkDwUfCahRUfb13NZlduGBhsxVY6KJ+htaQfGE2IS9DMI9ad7sUI3OsLhYr+hlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAxNCwgMjAyMyAyOjExIEFNDQoNCj4gDQo+IE9uIDYvMTQvMjAyMyAx
MjozMiBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IFpodSwgTGluZ3No
YW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAx
NCwgMjAyMyAxMjoyNyBBTQ0KPiA+Pj4gSWYgYSBkZXZpY2UgaGFzIGFzc3VtZWQgdGhhdCBxdWV1
ZV9yZXNldCBtdXN0IGJlIGRvbmUgYWZ0ZXINCj4gPj4+IERSSVZFUl9PSyBzdGFnZSBiZWNhdXNl
IHVudGlsIHRoYXQgcG9pbnQgdGhlIGRldmljZSBpcyBub3QgImxpdmUiLA0KPiA+Pj4gU3VjaCBk
ZXZpY2UgbmVlZHMgdGhlDQo+ID4+IGZpeC4NCj4gPj4gSSB0aGluayBxdWV1ZV9yZXNldCBqdXN0
IHJlc2V0cyB0aGUgcXVldWUgYW5kIGl0cyBmaWVsZHMgaW5jbHVkaW5nDQo+ID4+IHRoZSBxdWV1
ZV9lbmFibGUuIERSSVZFUl9PSyBpcyBub3QgYSBtdXN0IGZvciBwZXJmb3JtaW5nIGENCj4gPj4g
cXVldWVfcmVzZXQsIE15IHVuZGVyc3RhbmRpbmcgaXM6DQo+ID4+IC0gYmVmb3JlIERSSVZFUl9P
SywgdGhlIGRyaXZlciBjYW4gcmUtY29uZmlnIHRoZSBxdWV1ZSBhbnl0aW1lLA0KPiA+PiBkb2Vz
bid0IG5lZWQgYSByZXNldF9xdWV1ZQ0KPiA+IEJlZm9yZSBEUklWRVJfT0sgc3RhZ2UsIHRvIHJl
Y29uZmlndXJlIGEgcXVldWUsIGRyaXZlciBuZWVkcyB0byB3cml0ZQ0KPiBxdWV1ZV9lbmFibGUg
PSAwLg0KPiA+IFRoaXMgaXMgbm90IGFsbG93ZWQgaW4gdGhlIHNwZWMuDQo+ID4gU28gZHJpdmVy
IG5lZWQgdG8gdXNlIHF1ZXVlX3Jlc2V0IHRvIHJlY29uZmlndXJlLg0KPiBUaGUgc3BlYyByZXF1
aXJlcyB0aGUgZHJpdmVyIGNvbmZpZyBhbGwgb3RoZXIgZmllbGRzIGJlZm9yZSBzZXQgcXVldWVf
ZW5hYmxlLg0KPiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIHJlYWwgb2NjdXJyaW5n
IGNhc2VzIHRoYXQgcmUtY29uZmlnIHRoZSB2cSBmaWVsZHMNCj4gYmV0d2VlbiBxdWV1ZV9lbmFi
bGUgYW5kIERSSVZFUl9PSyBpbiB0aGUgaW5pdGlhbGl6YXRpb24uDQo+IA0KUHJvYmFibHkgdGhl
cmUgaXMgbm8gY2FzZSB0b2RheSwgYnV0IG1heSBiZSBpdCBjYW4gb2NjdXIgd2hlcmUgZHJpdmVy
IHRyaWVzIHRvIGNvbmZpZ3VyZSBzb21ldGhpbmcgYW5kIGlmIGl0IGZhaWxzLCBpdCBtYXkgbmVl
ZCB0byByb2xsIGJhY2sgYW5kIHJlLWNvbmZpZ3VyZSBxdWV1ZXMuDQoNCj4gQnV0IEkgYWdyZWUg
bWF5YmUgd2Ugc2hvdWxkIGFsbG93IHNldCBxdWV1ZV9lbmFibGUgPSAwLg0KPg0KVGhpcyBmdW5j
dGlvbmFsaXR5IG9mIHF1ZXVlX2VuYWJsZSA9IDAsIGlzIHN1cHBvcnRlZCB1c2luZyBxdWV1ZV9y
ZXNldCByZWdpc3Rlci4NCiANCj4gVGhpcyByZXNldCBtYXkgaGFwcGVuIGFmdGVyIERSSVZFUl9P
Sy4NCg0KWWVzLCB0aGUgcXVldWVfcmVzZXQgYWZ0ZXIgRFJJVkVSX09LIGlzIG5vdCBhbWJpZ3Vv
dXMuDQpRdWV1ZV9yZXNldCBiZWZvcmUgRFJJVkVSX09LIGhhcyB0aGUgYW1iaWd1aXR5LCBhbmQg
d2lsbCBjbGFyaWZ5IHRoYXQgaXQgc2hvdWxkIGJlIHN1cHBvcnRlZCBieSBkZXZpY2UgYmVmb3Jl
IERSSVZFUl9PSy4NCg0KRm9yIHRoZSBtYWluIG1vdGl2YXRpb24gb2YgdGhpcyBwYXRjaCwgdGhl
IF9SRVNFVCBiaXQgc2VlbXMgZW5vdWdoIHRvIHNlbGVjdGl2ZWx5IGVuYWJsZSB0aGUgcXVldWUg
YmVmb3JlIG9yIGFmdGVyIERSSVZFUl9PSy4NCg==

